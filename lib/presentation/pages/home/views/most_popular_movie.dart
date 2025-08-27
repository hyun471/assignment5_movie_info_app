import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/presentation/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key, required this.state});

  final MoivePoster state;

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
            ),
          ),
        ),
      ),
    );
  }
}
