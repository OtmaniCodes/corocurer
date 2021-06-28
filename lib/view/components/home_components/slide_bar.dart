import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/home_components/service_button.dart';
import 'package:flutter/material.dart';

class SlideBar extends StatefulWidget {
  @override
  _SlideBarState createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  bool slideBarIsOpened = false;

  closeSlideBar() {
    setState(() {
      this.slideBarIsOpened = false;
    });
  }

  Color _color = ThmColors.whiteClr;

  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      this.slideBarIsOpened ? Icons.arrow_drop_down : Icons.arrow_drop_up,
      color: _color,
      size: 30,
    );
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: AnimatedPositioned(
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
        onEnd: () {
          setState(() {
            _color = ThmColors.whiteClr;
          });
        },
        // top: screenSize.height * 0.15,
        bottom: this.slideBarIsOpened
            ? 0
            : -((screenSize.height * 0.6).toDouble() - 30),
        child: Container(
          height: screenSize.height * 0.6,
          width: screenSize.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ThmColors.redClr,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Material( 
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                      onTap: () {
                        _color = ThmColors.lightBlueClr;
                        setState(
                          () {
                            this.slideBarIsOpened = !this.slideBarIsOpened;
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [icon, icon, icon],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: (screenSize.height * 0.6).toDouble() - 30,
                decoration: BoxDecoration(
                  color: ThmColors.redClr,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ServiceBtn(
                        labelTxt: "About COVID",
                        icon: 'img10',
                        servicesOrder: 0,
                        onTap: this.closeSlideBar,
                      ),
                      SizedBox(height: 50),
                      ServiceBtn(
                        labelTxt: "Protection",
                        icon: 'img14',
                        servicesOrder: 1,
                        onTap: this.closeSlideBar,
                      ),
                      SizedBox(height: 50),
                      ServiceBtn(
                        labelTxt: "Related News",
                        icon: 'img34',
                        servicesOrder: 2,
                        onTap: this.closeSlideBar,
                      ),
                      SizedBox(height: 20),
                      // ServiceBtn(
                      //   labelTxt: "Statistics",
                      //   icon: 'img6',
                      //   servicesOrder: 3,
                      //   onTap: this.closeSlideBar,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    color: ThmColors.blackClr,
                    offset: Offset(0, -1),
                    spreadRadius: 2,
                    blurRadius: 8),
              ]),
        ),
      ),
    );
  }
}
