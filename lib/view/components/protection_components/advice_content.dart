import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/shared_components/loading_ring.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AdviceContent extends StatefulWidget {
  final String label;
  final String image;
  AdviceContent({this.label, this.image});

  @override
  _AdviceContentState createState() => _AdviceContentState();
}

class _AdviceContentState extends State<AdviceContent> {
  double _height = 0;
  List<String> txtLines = [];

  Future getText() async {
    String txtFileName;
    String imgNum = this.widget.image.substring(3, this.widget.image.length);
    if (imgNum == '26') {
      txtFileName = 'keep_distance';
    } else if (imgNum == '14') {
      txtFileName = 'wash_hands';
    } else if (imgNum == '19') {
      txtFileName = 'wear_mask';
    } else if (imgNum == '4') {
      txtFileName = 'avoid_animals';
    }
    String fileContent =
        await rootBundle.loadString('lib/services/database/$txtFileName.txt');
    LineSplitter.split(fileContent).forEach((line) => txtLines.add(line));
  }

  Widget txtFilterer(String line) {
    bool isHeader = false;
    if (line.startsWith('--')) isHeader = true;
    return Text(
      line.startsWith('--') ? line.substring(2, line.length) : line,
      style: TextStyle(
          color: isHeader ? ThmColors.lightBlueClr : ThmColors.whiteClr,
          shadows: isHeader
              ? [
                  Shadow(
                      color: ThmColors.blackClr,
                      offset: Offset(0.5, 1),
                      blurRadius: 2)
                ]
              : null,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.w600,
          letterSpacing: isHeader ? 0 : 1.0,
          fontSize: isHeader ? 24 : 14),
    );
  }

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 100), animateWidget);
  }

  void animateWidget(){
    _height = 550;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size phoneSize = MediaQuery.of(context).size;
    Dialog adviceDialog = Dialog(
      child: AnimatedContainer(
        curve: Curves.elasticOut,
        duration: Duration(milliseconds: 1000),
        height: _height,
        color: ThmColors.redClr,
        padding: const EdgeInsets.all(8.0),
        // margin: const EdgeInsets.all(500),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ThmColors.lightBlueClr, ThmColors.whiteClr],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 1]),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: phoneSize.height * 0.8,
            width: phoneSize.width * 0.85,
            decoration: BoxDecoration(
              color: ThmColors.redClr,
              image: DecorationImage(
                image: AssetImage("assets/covid_imgs/${this.widget.image}.png"),
                colorFilter: ColorFilter.mode(
                  ThmColors.redClr.withOpacity(0.1),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Center(
              child: Stack(
                children: [
                  FutureBuilder(
                    future: this.getText(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData == false) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 0.0, top: 5.0, bottom: 1.0),
                          child: Scrollbar(
                            thickness: 4,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: this
                                  .txtLines
                                  .map((line) => txtFilterer(line))
                                  .toList(),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('could not load data!');
                      }
                      return LoadingRing();
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      this.widget.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThmColors.blackClr.withOpacity(0.1),
                        fontFamily: "UbuntuFam",
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return adviceDialog;
  }
}
