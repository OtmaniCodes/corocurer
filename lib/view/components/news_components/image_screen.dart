import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/models/post.dart';
import 'package:corocurer/view/components/news_components/details_popup.dart';
import 'package:corocurer/view/components/news_components/web_view.dart';

class ImageScreen extends StatelessWidget {
  final Post post;
  ImageScreen({this.post});

  onMenuButton(String text, context) {
    if (text == 'Details') {
      showDialog(
        context: context,
        builder: (BuildContext context) => DetailsPopup(text: text, post: this.post)
      );
    }else if(text == 'See More'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowWebView(post: this.post)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThmColors.blackClr.withOpacity(0.5),
      appBar: AppBar(
        title: Text(this.post.title),
        backgroundColor: ThmColors.blackClr,
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 35,
            ),
            itemBuilder: (_) => ['Details', 'See More']
                .map(
                  (text) => PopupMenuItem(
                    child: Text(text),
                    value: text,
                  ),
                )
                .toList(),
            onSelected: (text) {
              onMenuButton(text, context);
            },
          ),
        ],
      ),
      body: Container(
        child: Hero(
          tag: 'article-img-${this.post.imageUrl}',
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained,
            imageProvider: NetworkImage(this.post.imageUrl),
          ),
        ),
      ),
    );
  }
}
