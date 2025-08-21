import 'package:assignment5_movie_info_app/pages/home/views/thumbnail_box.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  MovieList({
    required this.thumbnailHeight,
    required this.thumbnailWidth,
  });
  double thumbnailHeight;
  double thumbnailWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: thumbnailHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
              ThumbnailBox(
                thumbnailHeight: thumbnailHeight,
                thumbnailWidth: thumbnailWidth,
              ),
              index != 4
                  ? SizedBox(width: 10)
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
