import 'package:assignment5_movie_info_app/common/models/moive_poster_model.dart';
import 'package:assignment5_movie_info_app/pages/home/views/thumbnail_box.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  MovieList({
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.state,
    required this.category,
  });
  final double thumbnailHeight;
  final double thumbnailWidth;
  final List<MoivePosterModel> state;
  final String category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: thumbnailHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              ThumbnailBox(
                thumbnailHeight: thumbnailHeight,
                thumbnailWidth: thumbnailWidth,
                state: state[index],
                categroy: category,
                index: index,
              ),
              index != state.length - 1
                  ? SizedBox(width: 10)
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
