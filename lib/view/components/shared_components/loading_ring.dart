import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';

class LoadingRing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
          color: ThmColors.whiteClr,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: ThmColors.blackClr, width: 2)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              backgroundColor: ThmColors.redClr,
              strokeWidth: 5.0,
            ),
            SizedBox(height: 10),
            Text('Data is loading...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "UbuntuFam"))
          ],
        ),
      ),
    );
  }
}
