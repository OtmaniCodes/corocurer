import 'package:corocurer/view/components/protection_components/advice_card.dart';
import 'package:corocurer/view/components/home_components/upper_bar.dart';
import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/shared_components/faded_bg_image.dart';

class ProtectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            top: 0,
            child: UpperBar(titleTxt: "Protection"),
          ),
          FadedBg(img: "img29"),
          Positioned(
              top: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      AdviceCard(
                        rihgtCorner: false,
                        image: 'img26',
                        label: 'keep a distance',
                        onTap: () {
                          print(1);
                        },
                      ),
                      AdviceCard(
                        rihgtCorner: true,
                        image: 'img14',
                        label: 'wash your hands',
                        onTap: () {
                          print(2);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AdviceCard(
                        rihgtCorner: false,
                        image: 'img19',
                        label: 'keep your mask on',
                        onTap: () {
                          print(3);
                        },
                      ),
                      AdviceCard(
                        rihgtCorner: true,
                        image: 'img4',
                        label: 'careful around animals',
                        onTap: () {
                          print(4);
                        },
                      ),
                    ],
                  ),
                ],
              ))
        ],
      );
  }
}
