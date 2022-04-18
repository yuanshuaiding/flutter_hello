import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'main2.dart';

/// 嵌套listview,滚动视差效果demo
class ParallaxListDemo extends StatelessWidget {
  get imgUrl => networkImgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "视差滚动效果演示",
      )),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text(
            //   "视差滚动效果演示",
            // ),
            automaticallyImplyLeading: false,
            floating: true,
            flexibleSpace: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              imageUrl: imgUrl,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            expandedHeight: 200,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              title: Text("list item $index"),
            );
          }, childCount: 100))
        ],
      ),
    );
  }
}
