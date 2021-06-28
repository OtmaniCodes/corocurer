import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';

class UpperTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ThmColors.redClr,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: ThmColors.blackClr,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: ThmColors.blackClr,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ThmColors.whiteClr, ThmColors.darkLightBlueClr],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: RichText(
              text: TextSpan(
                text: "CORO",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ThmColors.redClr,
                    fontFamily: "StokeFam"),
                children: [
                  TextSpan(
                    text: "CURER",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ThmColors.blackClr,
                        fontFamily: "StokeFam"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
