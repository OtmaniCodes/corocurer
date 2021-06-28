import 'package:corocurer/models/post.dart';
import 'package:flutter/material.dart';

class DetailsPopup extends StatelessWidget {
  final String text;
  final Post post;
  DetailsPopup({this.text, this.post});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(text),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Source: ',
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: '${this.post.sourceName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              text: 'Domain: ',
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: '${this.post.sourceDomaine ?? 'Unknown'}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              text: 'Published on: ',
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: '${this.post.publishedDateTime}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
