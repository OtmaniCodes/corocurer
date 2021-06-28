import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';

class TextFrame extends StatefulWidget {
  final List data;
  TextFrame({this.data});

  @override
  _TextFrameState createState() => _TextFrameState();
}

class _TextFrameState extends State<TextFrame> {
  List<Widget> textLines(data) {
    List<Widget> texts = [];
    for (String line in data.sublist(1)) {
      texts.add(Text("- " + line + "\n",
        style: TextStyle(color: ThmColors.whiteClr),
      ),
    );
  }
    return texts;
  }
  double _margin = 50;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 100), animateTextFrame);
  }

  animateTextFrame(){
    _margin = 8.0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          margin: EdgeInsets.only(top: _margin, bottom: _margin, left: 8.0, right: 8.0),
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          decoration: BoxDecoration(
            color: ThmColors.darkLightBlueClr,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: ThmColors.whiteClr, width: 3),
            boxShadow: [BoxShadow(color: ThmColors.blackClr, offset: Offset(0,1),blurRadius: 1 , spreadRadius: 2.0)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data[0],
                style: TextStyle(
                    color: ThmColors.whiteClr,
                    fontSize: 30,
                    fontFamily: "UbuntuFam",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: this.textLines(widget.data),
              )
            ],
          ),
        ),
      ],
    );
  }
}
