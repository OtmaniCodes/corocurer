import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:corocurer/models/collection.dart';
import 'package:corocurer/models/statistics.dart';

class StatisticsChart extends StatelessWidget {
  final List<Statistic> statistics;
  final String collection;
  StatisticsChart({
    this.statistics,
    this.collection,
  });

  int collectionPerMillion(int index) {
    int output;
    if (this.collection == 'deaths') {
      output = statistics[index].deathsPerMillion;
    } else if (this.collection == "cases") {
      output = statistics[index].casesPerMillion;
    } else if (this.collection == "tests") {
      output = statistics[index].testsPerMillion;
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SfCartesianChart(
        // Initialize category axis
        primaryXAxis: CategoryAxis(),
        series: [
          LineSeries(
            // Bind data source
            dataSource: List.generate(
              this.statistics.length,
              (index) => CollectionData(
                country: statistics[index].country,
                collectionPerMillion: this.collectionPerMillion(index),
              ),
            ).toList(),
            xValueMapper: (collectionData, _) => collectionData.country,
            yValueMapper: (collectionData, _) =>
                collectionData.collectionPerMillion,
          ),
        ],
      ),
    );
  }
}
