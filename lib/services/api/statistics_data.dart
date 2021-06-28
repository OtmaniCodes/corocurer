import 'package:corocurer/config/api_info.dart';
import 'package:corocurer/models/statistics.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetStatisticsData {
  final ApiInfo apiInfos = ApiInfo();

  // fetching most recent statistics that has to do with COVID in the US
  Future<List<Statistic>> getStatistics() async {
    http.Response statisticsResponse = await http.get(
      apiInfos.getUrl("statistics"),
      headers: {
        "x-rapidapi-key": apiInfos.apiKey,
        "x-rapidapi-host": apiInfos.getHost("statistics"),
      },
    );
    if (statisticsResponse.statusCode == 200) {
      return jsonDecode(statisticsResponse.body)["response"]
          .map((Map element) => Statistic.fromJson(parsedJson: element))
          .toList();
    } else {
      throw Exception("some error has occured!");
    }
  }
}
