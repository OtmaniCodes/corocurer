import 'package:corocurer/models/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './view/screens/home.dart';
import './view/screens/covid_info.dart';
import './view/screens/protection.dart';
import './view/screens/news.dart';
import './view/screens/statistics.dart';
import 'package:corocurer/config/theme_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScreensModel(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "StokeFam",
          primaryColor: ThmColors.redClr,
        ),
        debugShowCheckedModeBanner: false,
        title: "corocurer",
        routes: {
          "/home": (context) => HomeScreen(),
          "/info": (context ) => CovidInfoScreen(),
          "/protection": (context) => ProtectionScreen(),
          "/news": (context) => NewsScreen(),
          // "/statistics": (context) => StatisticsScreen()
        },
        initialRoute: "/home",
      ),
    );
  }
}