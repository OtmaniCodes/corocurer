import 'package:corocurer/view/components/home_components/slide_bar.dart';
import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/home_components/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => MenuPopup(text: 'Exit'));
        return Future.value(false);
      }, // used to provent popping the route when pressing on back button
      child: Scaffold(
        backgroundColor: ThmColors.lightBlueClr,
        appBar: AppBar(
          backgroundColor: ThmColors.redClr,
          elevation: 0,
          leadingWidth: 45,
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                size: 35,
              ),
              itemBuilder: (_) => ['About us?', 'Exit']
                  .map((text) => PopupMenuItem(
                        child: Text(text),
                        value: text,
                      ))
                  .toList(),
              onSelected: (text) {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) => MenuPopup(text: text),
                );
              },
            )
          ],
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 5),
              CircleAvatar(
                backgroundColor: ThmColors.whiteClr,
                radius: 20.0,
                child: Image.asset(
                  'assets/coro_logo.png',
                  height: 40,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            HomeBg(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UpperTitle(),
                SizedBox(height: 20),
              ],
            ),
            SlideBar()
          ],
        ),
      ),
    );
  }
}
