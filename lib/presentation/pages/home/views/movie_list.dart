import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/presentation/pages/home/views/thumbnail_box.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.state,
    required this.category,
  });
  final double thumbnailHeight;
  final double thumbnailWidth;
  final List<MoivePoster> state;
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
          final movie = state[index];
          return Row(
            children: [
              ThumbnailBox(
                thumbnailHeight: thumbnailHeight,
                thumbnailWidth: thumbnailWidth,
                state: movie,
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
