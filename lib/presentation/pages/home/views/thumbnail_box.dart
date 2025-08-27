import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/presentation/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';

/// 작은 영화 포스터 썸네일 박스 위젯
class ThumbnailBox extends StatefulWidget {
  const ThumbnailBox({
    super.key,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.state,
    required this.categroy,
    required this.index,
  });
  final double thumbnailHeight;
  final double thumbnailWidth;
  final MoviePoster state;
  final String categroy;
  final int index;

  @override
  State<ThumbnailBox> createState() => _ThumbnailBoxState();
}

class _ThumbnailBoxState extends State<ThumbnailBox> {
  @override
  Widget build(BuildContext context) {
    String tag = '${widget.categroy}: ${widget.index}';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              tag: tag,
              id: widget.state.id,
              posterPath:
                  'https://image.tmdb.org/t/p/w300${widget.state.posterPath}',
            ),
          ),
        );
      },
      child: Hero(
        tag: tag,
        child: SizedBox(
          width: widget.thumbnailWidth,
          height: widget.thumbnailHeight,

          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(
              'https://image.tmdb.org/t/p/w300${widget.state.posterPath}',
            ),
          ),
        ),
      ),
    );
  }
}
