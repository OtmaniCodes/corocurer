import 'package:flutter/material.dart';

import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/news_components/articale_image.dart';
import 'package:corocurer/models/post.dart';

class NewsFrame extends StatefulWidget {
  final Post post;
  NewsFrame({this.post});

  @override
  _NewsFrameState createState() => _NewsFrameState();
}

class _NewsFrameState extends State<NewsFrame> {
  final TextStyle textStyle = TextStyle(fontFamily: "UbuntuFam",fontSize: 16,color: ThmColors.whiteClr);
  double _margin = 20.0;
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 100), animateNewsFrame);
  }

  void animateNewsFrame(){
    _margin = 15;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: ThmColors.blackClr, offset: Offset(0,2),blurRadius: 3 , spreadRadius: 2.0),],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: ThmColors.whiteClr, width: 2),
          color: ThmColors.darkLightBlueClr),
      margin: EdgeInsets.only(top: _margin, left: 8.0, right: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              this.widget.post.title,
              style: TextStyle(
                color: ThmColors.whiteClr,
                fontFamily: "UbuntuFam",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Hero(
                tag: 'article-img-${this.widget.post.imageUrl}',
                child: RoundedImage(
                  post: this.widget.post,
                )),
            SizedBox(height: 10),
            Text(
              this.widget.post.excerpt,
              style: TextStyle(color: ThmColors.whiteClr),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.widget.post.publishedDateTime ?? "No Date",
                  style: textStyle
                ),
                Text(
                  this.widget.post.sourceName ?? "Unknown",
                  style: textStyle
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
