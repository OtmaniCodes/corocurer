import 'dart:async';

import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';

class HomeBg extends StatefulWidget {
  @override
  _HomeBgState createState() => _HomeBgState();
}

class _HomeBgState extends State<HomeBg> {
  List<String> sentences = [
    "People who don’t have symptoms can spread the virus.",
    "The COVID-19 virus can live on surfaces for days.",
    "Coronavirus can make babies seriously ill.",
    "Some people with COVID-19 have digestive symptoms.",
    "The FDA has approved the first targeted COVID-19 treatment."
  ];
  int image = 1;
  String displayedText = '';
  bool showCursor = true;
  Timer myTimer;

  @override
  void initState() {
    super.initState();
    // myTimer = Timer.periodic(
    //   Duration(seconds: 3),
    //   (timer) {
    //     setState(
    //       () {
    //         if (this.image == 5) this.image = 0;
    //         this.image += 1;
    //       },
    //     );
    //   },
    // );
    typeSentence();
  }

  @override
  void dispose() {
    myTimer.cancel();
    super.dispose();
  }

  void typeSentence() async {
    for (String sentence in sentences) {
      for (String char in sentence.split('')) {
        setState(() {
          displayedText += char;
          if (displayedText.length == sentence.length)
            showCursor = false;
          else
            showCursor = true;
        });
        await Future.delayed(Duration(milliseconds: 150));
      }
      await Future.delayed(Duration(milliseconds: 300));
      this.displayedText = "";
    }
    typeSentence();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
        
          width: screenSize.width,
          height: screenSize.height,
          child: Image.asset(
            'assets/bg_imgs/img${this.image}.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height,
          color: ThmColors.transparentWhiteClr,
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          height: screenSize.height * 0.2,
          width: screenSize.width * 0.75,
          decoration: BoxDecoration(
              color: ThmColors.redClr.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: this.displayedText,
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 1.0,
                      color: ThmColors.whiteClr,
                      fontFamily: "UbuntuFam",
                    ),
                  ),
                  TextSpan(
                    text: showCursor ? "|" : "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: ThmColors.blackClr),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
