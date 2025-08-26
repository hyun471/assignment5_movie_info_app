import 'package:assignment5_movie_info_app/common/models/moive_poster_model.dart';
import 'package:assignment5_movie_info_app/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key, required this.state});

  final MoivePosterModel state;

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    return GestureDetector(
      onTap: () {
        // TODO 나중에 수정
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              tag: '가장 인기있는',
              id: widget.state.id,
              posterPath:
                  'https://image.tmdb.org/t/p/w300${widget.state.posterPath}',
            ),
          ),
        );
      },
      child: Hero(
        tag: '가장 인기있는',
        child: SizedBox(
          width: double.infinity,
          height: 560,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(
              'https://image.tmdb.org/t/p/w300${widget.state.posterPath}',
              fit: BoxFit.cover,
              // frameBuilder:
              //     (
              //       context,
              //       child,
              //       frame,
              //       wasSynchronouslyLoaded,
              //     ) {
              //       if (frame != null) {
              //         WidgetsBinding.instance
              //             .addPostFrameCallback((_) {
              //               setState(() {
              //                 isLoading = false;
              //               });
              //             });
              //       }
              //       return child;
              //     },
            ),
          ),
        ),
      ),
    );
  }
}
