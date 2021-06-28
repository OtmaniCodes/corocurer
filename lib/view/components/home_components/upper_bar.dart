import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';

class UpperBar extends StatelessWidget {
  final String titleTxt;
  UpperBar({this.titleTxt});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ThmColors.darkLightBlueClr,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: ThmColors.blackClr,
                        spreadRadius: 1,
                        offset: Offset(0, 2))
                  ]),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ThmColors.darkLightBlueClr,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                      colors: [ThmColors.lightBlueClr, ThmColors.whiteClr],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.5, 1]),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: ThmColors.redClr,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        this.titleTxt,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: ThmColors.whiteClr,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
