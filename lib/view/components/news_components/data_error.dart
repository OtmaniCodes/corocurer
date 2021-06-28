import 'dart:io';

import 'package:corocurer/config/theme_colors.dart';
import 'package:flutter/material.dart';

class OnDataError extends StatelessWidget {
  final Object error;
  OnDataError({this.error});

  @override
  Widget build(BuildContext context) {
    String txt1;
    String txt2;
    IconData icon;
    try {
      throw error;
    } on SocketException {
      txt1 = 'There is No Internet!';
      txt2 = '(Check out your: Signal, Internet, WiFi...)';
      icon = Icons.wifi_off;
    } on HttpException {
      txt1 = 'we could not find the posts.';
      txt2 = '(go and come back later...)';
      icon = Icons.image_not_supported;
    } catch (e) {
      txt1 = 'Oops! Something Went Wrong.';
      txt2 = '';
      icon = Icons.error_outline;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: ThmColors.transparentBlackClr, size: 70),
        SizedBox(height: 10),
        Text(
          txt1,
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: ThmColors.blackClr),
        ),
        Text(
          txt2,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: ThmColors.blackClr,
          ),
        ),
      ],
    );
  }
}
