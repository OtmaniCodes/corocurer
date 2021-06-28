
import 'package:flutter/material.dart';

import 'package:corocurer/models/post.dart';
import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/view/components/news_components/image_screen.dart';

class RoundedImage extends StatelessWidget {
  final Post post;
  RoundedImage({this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.post.imageUrl.startsWith('assets') == false) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ImageScreen(
                post: this.post,
              ),
            ),
          );
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("There was a problem loading this image!"),
                  actions: [
                    TextButton(
                      child: Text('OK',
                          style: TextStyle(color: ThmColors.lightBlueClr)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }
            );
        }
      },
      child: Container(
        child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: ThmColors.whiteClr, width: 2),
            ),
            child: this.post.imageUrl.startsWith('assets')
                ? Image.asset(this.post.imageUrl)
                : Image.network(
                    this.post.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        return child;
                      } else {
                        return Image.asset('assets/article_placeholder.jpg');
                      }
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
