import 'package:assignment5_movie_info_app/common/models/moive_poster_model.dart';
import 'package:assignment5_movie_info_app/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';

class ThumbnailBox extends StatelessWidget {
  ThumbnailBox({
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.state,
  });
  final double thumbnailHeight;
  final double thumbnailWidth;
  final MoivePosterModel state;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO 나중에 수정
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Hero(
        tag: state.id,
        child: SizedBox(
          width: thumbnailWidth,
          height: thumbnailHeight,

          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(
              'https://image.tmdb.org/t/p/w300${state.posterPath}',
            ),
          ),
        ),
      ),
    );
  }
}
