import 'package:flutter/cupertino.dart';

class ScreensModel with ChangeNotifier{
  int _screenIndex;
  get getScreenIndex => _screenIndex;
  set setScreenIndex(int index){
    _screenIndex = index;
    print("changed to $index");
    notifyListeners();
  }
}