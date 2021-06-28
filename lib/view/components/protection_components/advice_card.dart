import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/protection_components/advice_content.dart';

class AdviceCard extends StatelessWidget {
  final String image;
  final String label;
  final bool rihgtCorner;
  Function onTap;
  AdviceCard({this.image, this.label, this.rihgtCorner, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BorderRadius curvedBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
      bottomRight:
          this.rihgtCorner == true ? Radius.circular(30) : Radius.circular(0),
      bottomLeft:
          this.rihgtCorner == false ? Radius.circular(30) : Radius.circular(0),
    );
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.29,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
          borderRadius: curvedBorderRadius,
          color: ThmColors.darkLightBlueClr,
          boxShadow: [
            BoxShadow(
                color: ThmColors.blackClr,
                offset: Offset(0, 2.0),
                blurRadius: 5)
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: curvedBorderRadius,
          onTap: () {
            this.onTap();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AdviceContent(
                  image: this.image,
                  label: this.label,
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/covid_imgs/${this.image}.png',
                    width: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      this.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThmColors.whiteClr,
                          fontFamily: "UbuntuFam",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
