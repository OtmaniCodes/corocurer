import 'dart:io';
import 'package:corocurer/config/theme_colors.dart';
import 'package:flutter/material.dart';

class MenuPopup extends StatelessWidget {
  final String text;
  MenuPopup({this.text});

  @override
  Widget build(BuildContext context) {
    Widget popUp;
    if (text == 'Exit') {
      AlertDialog exitPopup = AlertDialog(
        backgroundColor: ThmColors.whiteClr,
        title: Text(
          'Exit',
        ),
        content: Text('are you sure you want to exit the app?'),
        actions: [
          TextButton(
            child: Text('Yes',style: TextStyle(color: ThmColors.lightBlueClr)),
            onPressed: () {
              exit(0);
            },
          ),
        ],
      );
      popUp = exitPopup;
    } else if (text == 'About us?') {
      AboutDialog aboutPopup = AboutDialog(
        applicationName: 'CoroCurer',
        applicationIcon: Image.asset(
          'assets/coro_logo.png',
          width: 55,
        ),
        applicationVersion: '1.0.0',
        applicationLegalese:
            'produced by Ahmed El Otmani, all rights reserved 2021',
      );
      popUp = aboutPopup;
    }
    return popUp;
  }
}
