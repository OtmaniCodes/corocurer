import 'package:corocurer/models/screens.dart';
import 'package:flutter/material.dart';

import 'package:corocurer/view/screens/routes_manager.dart';
import 'package:corocurer/config/theme_colors.dart';
import 'package:provider/provider.dart';

class ServiceBtn extends StatelessWidget {
  final String labelTxt;
  final String icon;
  final int servicesOrder;
  final Function onTap;

  ServiceBtn({
    this.labelTxt,
    this.icon,
    this.servicesOrder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenModel = Provider.of<ScreensModel>(context);
    return Expanded(
      child: Container(
        //  width: 100,
        height: 80,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: ThmColors.transparentBlackClr,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 80 / 100,
          padding: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: ThmColors.lightBlueClr,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: ThmColors.redClr,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: () {
                  screenModel.setScreenIndex = this.servicesOrder;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RoutesManager(
                        pageOrder: this.servicesOrder,
                      ),
                    ),
                  );
                  this.onTap();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: ThmColors.blackClr, shape: BoxShape.circle),
                        child: CircleAvatar(
                          child:
                              Image.asset('assets/covid_imgs/${this.icon}.png'),
                          radius: 20,
                          backgroundColor: ThmColors.whiteClr,
                        ),
                      ),
                      SizedBox(width: 18),
                      Text(
                        this.labelTxt,
                        style: TextStyle(
                          fontFamily: "UbuntuFam",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: ThmColors.whiteClr,
                        ),
                      ),
                    ],
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
