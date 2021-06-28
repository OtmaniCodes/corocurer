import 'package:corocurer/view/components/news_components/data_error.dart';
import 'package:corocurer/view/components/shared_components/loading_ring.dart';
import 'package:corocurer/view/components/statistics_components/collection_chart.dart';
import 'package:flutter/material.dart';

import 'package:corocurer/services/api/statistics_data.dart';
import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/home_components/upper_bar.dart';
import 'package:corocurer/view/components/shared_components/faded_bg_image.dart';
import 'package:corocurer/models/statistics.dart';
import 'package:corocurer/models/collection.dart';

class StatisticsScreen extends StatefulWidget {
  StatisticsScreen({Key key}) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  // List<Statistic> statistics = [];
  // List statisticsData;
GetStatisticsData data = GetStatisticsData();
  // Future<Map> getData() {
  //   GetStatisticsData data = GetStatisticsData();
  //   return data.getStatistics();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   this.statisticsData = getData();
  // }

  // setStatisticsData(snapshotData) {
  //   snapshotData['response'].forEach(
  //     (Map val) {
  //       Statistic statistic = Statistic.fromJson(parsedJson: val);
  //       statistics.add(statistic);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          FadedBg(img: "img6"),
          Center(
            child: FutureBuilder(
              future: data.getStatistics(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  // this.setStatisticsData(snapshot.data);
                  return ListView(
                    children: [
                      StatisticsChart(
                          statistics: snapshot.data, collection: 'cases'),
                      SizedBox(height: 20),
                      StatisticsChart(
                          statistics: snapshot.data, collection: 'deaths'),
                      SizedBox(height: 20),
                      StatisticsChart(
                          statistics: snapshot.data, collection: 'tests'),
                    ],
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return OnDataError(error: snapshot.error);
                }
                return LoadingRing();
              },
            ),
          ),
          Positioned(
            // there must be some debugging in here
            top: 0,
            child: UpperBar(titleTxt: "Statistics"),
          ),
        ],
      );
  }
}
