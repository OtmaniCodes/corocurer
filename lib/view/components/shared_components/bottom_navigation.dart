import 'package:corocurer/models/screens.dart';
import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';
import 'package:provider/provider.dart';

class MyBottomNavigation extends StatefulWidget {
  final int pageOrder;
  // final Function switchPage;
  MyBottomNavigation({this.pageOrder});

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  bool page1 = true;
  bool page2 = false;
  bool page3 = false;
  bool page4 = false;

  void initState() {
    super.initState();
    this.changeNavBar(this.widget.pageOrder);
  }

  void changeNavBar(int myCase) {
    switch (myCase) {
      case 0:
        setState(() {
          this.page1 = true;
          this.page2 = false;
          this.page3 = false;
          this.page4 = false;
        });
        break;
      case 1:
        setState(() {
          this.page1 = false;
          this.page2 = true;
          this.page3 = false;
          this.page4 = false;
        });
        break;
      case 2:
        setState(() {
          this.page1 = false;
          this.page2 = false;
          this.page3 = true;
          this.page4 = false;
        });
        break;
      case 3:
        setState(() {
          this.page1 = false;
          this.page2 = false;
          this.page3 = false;
          this.page4 = true;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenModel = Provider.of<ScreensModel>(context);
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: ThmColors.redClr,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: ThmColors.blackClr,
                spreadRadius: 1,
                offset: Offset(0, -2))
          ]),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  this.changeNavBar(0);
                  screenModel.setScreenIndex = 0;
                  // this.widget.switchPage(0);
                },
                child: MyItemButton(
                  isActive: this.page1,
                  btnImage: Icons.coronavirus_rounded,
                  txtLabel: 'Covid',
                )),
            GestureDetector(
              onTap: () {
                this.changeNavBar(1);
                screenModel.setScreenIndex = 1;
                // this.widget.switchPage(1);
              },
              child: MyItemButton(
                isActive: this.page2,
                btnImage: Icons.sanitizer,
                txtLabel: 'Protection',
              ),
            ),
            GestureDetector(
              onTap: () {
                this.changeNavBar(2);
                screenModel.setScreenIndex = 2;
                // this.widget.switchPage(2);
              },
              child: MyItemButton(
                isActive: this.page3,
                btnImage: Icons.article,
                txtLabel: 'News',
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     this.changeNavBar(3);
            //     screenModel.setScreenIndex = 3;
            //     // this.widget.switchPage(3);
            //   },
            //   child: MyItemButton(
            //     isActive: this.page4,
            //     btnImage: Icons.analytics,
            //     txtLabel: 'Statistics',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MyItemButton extends StatelessWidget {
  final IconData btnImage;
  final String txtLabel;
  final bool isActive;

  MyItemButton({this.btnImage, this.isActive, this.txtLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: ThmColors.lightBlueClr, shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: this.isActive
                ? ThmColors.darkLightBlueClr
                : ThmColors.whiteClr,
            radius: 20,
            child: Icon(this.btnImage)
          ),
        ),
      ],
    );
  }
}
