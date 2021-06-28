import 'package:corocurer/models/screens.dart';
import 'package:corocurer/view/components/shared_components/loading_ring.dart';
import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/shared_components/bottom_navigation.dart';
import 'package:corocurer/view/screens/covid_info.dart';
import 'package:corocurer/view/screens/protection.dart';
import 'package:corocurer/view/screens/news.dart';
import 'package:corocurer/view/screens/statistics.dart';
import 'package:provider/provider.dart';

class RoutesManager extends StatefulWidget {
  int pageOrder;
  RoutesManager({this.pageOrder});

  @override
  _RoutesManagerState createState() => _RoutesManagerState();
}

class _RoutesManagerState extends State<RoutesManager> {
  PageController _pageController;

  List<Widget> _screens = [
    CovidInfoScreen(key: PageStorageKey("covidInfoScreen")),
    ProtectionScreen(),
    NewsScreen(key: PageStorageKey("newsScreen")),
    StatisticsScreen(key: PageStorageKey("statisticsScreen"))
  ];

  // responsable of animating the routes transition
  // Future switchPage(page) {
  //   return _pageController.animateToPage(
  //     page,
  //     duration: Duration(milliseconds: 500),
  //     curve: Curves.linear,
  //   );
  // }

  // void initState() {
  //   super.initState();
  //   if (this.widget.pageOrder == 0) {
  //     this._pageController = PageController(initialPage: 0);
  //   } else if (this.widget.pageOrder == 1) {
  //     this._pageController = PageController(initialPage: 1);
  //   } else if (this.widget.pageOrder == 2) {
  //     this._pageController = PageController(initialPage: 2);
  //   } else if (this.widget.pageOrder == 3) {
  //     this._pageController = PageController(initialPage: 3);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    var screenModel = Provider.of<ScreensModel>(context);
    return Scaffold(
        bottomNavigationBar: MyBottomNavigation(
          pageOrder: this.widget.pageOrder,
          // switchPage: this.switchPage,
        ),
        backgroundColor: ThmColors.lightBlueClr,
        body: this._screens[screenModel.getScreenIndex]);
  }
}
