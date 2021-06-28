import 'package:flutter/material.dart';

import 'package:corocurer/models/post.dart';
import 'package:corocurer/view/components/home_components/upper_bar.dart';
import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/services/api/news_data.dart';
import 'package:corocurer/view/components/shared_components/faded_bg_image.dart';
import 'package:corocurer/view/components/shared_components/loading_ring.dart';
import 'package:corocurer/view/components/news_components/widgets.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future articalsData;

  Future getData() {
    GetNewsData getData = GetNewsData();
    return getData.getArticals();
  }

  @override
  void initState() {
    super.initState();
    this.articalsData = getData();
  }

  String getImage(data) {
    if (data['images'] == null || data['images'].isEmpty) {
      return 'assets/article_placeholder.jpg';
    } else {
      return data['images'][0]['url'];
    }
  }

  String formatTime(String receivedDate) {
    DateTime date = DateTime.parse(receivedDate);
    return '${date.month}/${date.day}/${date.year}'.toString();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          FadedBg(img: "img21"),
          Center(
            child: FutureBuilder(
              future: this.articalsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            displacement: 100,
                            onRefresh: () => getData(),
                            color: ThmColors.redClr,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data['news'].length,
                              itemBuilder: (context, index) {
                                try {
                                  Post post = Post.fromJson(
                                      parsedJson: snapshot.data,
                                      index: index,
                                      getImage: this.getImage,
                                      formatTime: this.formatTime);
                                  return Column(
                                    children: [
                                      SizedBox(
                                          height: index == 0
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  7
                                              : 0),
                                      NewsFrame(post: post),
                                    ],
                                  );
                                } catch (error) {
                                  return Container(height: 0.0, width: 0.0);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return OnDataError(
                    error: snapshot.error,
                  );
                }
                return LoadingRing();
              },
            ),
          ),
          Positioned(
            top: 0,
            child: UpperBar(titleTxt: "News"),
          ),
        ],
      );
  }
}
