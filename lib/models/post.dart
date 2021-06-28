import 'package:flutter/cupertino.dart';

class Post {
  final String title;
  final String excerpt;
  final String webUrl;
  final String imageUrl;
  final String publishedDateTime;
  final String sourceName;
  final String sourceDomaine;

  Post({
    @required this.title,
    @required this.excerpt,
    @required this.webUrl,
    @required this.imageUrl,
    @required this.publishedDateTime,
    @required this.sourceName,
    @required this.sourceDomaine,
  });

  Post.fromJson(
      {Map<String, dynamic> parsedJson,
      int index,
      Function getImage,
      Function formatTime})
      : this.title = parsedJson['news'][index]['title'],
        this.excerpt = parsedJson['news'][index]['excerpt'],
        this.webUrl = parsedJson['news'][index]['webUrl'],
        this.imageUrl = getImage(parsedJson['news'][index]),
        this.publishedDateTime =
            formatTime(parsedJson['news'][index]['publishedDateTime']),
        this.sourceDomaine = parsedJson['news'][index]['provider']['domain'],
        this.sourceName = parsedJson['news'][index]['provider']['name'];
}
