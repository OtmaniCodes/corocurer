import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';

class FadedBg extends StatelessWidget {
  final String img;
  FadedBg({this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/covid_imgs/${this.img}.png'),
          colorFilter: ColorFilter.mode(
            ThmColors.lightBlueClr.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
    );
  }
}
