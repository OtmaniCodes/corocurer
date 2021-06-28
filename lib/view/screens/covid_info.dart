import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:corocurer/view/components/home_components/upper_bar.dart';
import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/shared_components/faded_bg_image.dart';
import 'package:corocurer/view/components/shared_components/loading_ring.dart';
import 'package:corocurer/view/components/covid_info_components/covid_text_frame.dart';

class CovidInfoScreen extends StatefulWidget {
  CovidInfoScreen({Key key}) : super(key: key);

  @override
  _CovidInfoScreenState createState() => _CovidInfoScreenState();
}

class _CovidInfoScreenState extends State<CovidInfoScreen> {

  Future<Map> getData(context) async {
    var jsonData = await DefaultAssetBundle.of(context)
        .loadString('lib/services/database/covid_info.json');
    return jsonDecode(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          FadedBg(img: "img10"),
          Center(
            child: FutureBuilder(
              future: this.getData(context),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  CovidData covidData = CovidData(snapshot.data);
                  List content = covidData.convertToList();
                  return SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: content.length,
                            itemBuilder: (context, index) =>
                                Column(
                                  children: [
                                    SizedBox(height: index == 0 ? MediaQuery.of(context).size.height / 7 : 0),
                                    TextFrame(data: content[index]),
                                  ],
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('error');
                }
                return LoadingRing();
              },
            ),
          ),
          Positioned(
            top: 0,
            child: UpperBar(
              titleTxt: "About COVID",
            ),
          ),
        ],
      );
  }
}

class CovidData {
  Map receivedData;

  CovidData(Map receivedData) {
    this.receivedData = receivedData;
  }

  List convertToList() {
    List<List<String>> convertedData = [];
    List<String> tempList = [];
    List<String> keys = this.receivedData.keys.toList();
    List values = this.receivedData.values.toList();
    for (String key in keys) {
      tempList.add(key);
      for (var content in values[keys.indexOf(key)]) {
        if (content.runtimeType != String) {
          content.forEach((element) => tempList.add(element));
        } else {
          tempList.add(content);
        }
      }
      convertedData.add(tempList.toList());
      tempList.clear();
    }
    return convertedData;
  }
}
