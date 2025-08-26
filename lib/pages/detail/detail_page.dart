import 'package:assignment5_movie_info_app/pages/detail/view_model/detail_view_model.dart';
import 'package:assignment5_movie_info_app/pages/detail/views/box_office_info.dart';
import 'package:assignment5_movie_info_app/pages/detail/views/category.dart';
import 'package:assignment5_movie_info_app/pages/detail/views/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  String tag;
  String id;
  String posterPath;
  DetailPage({
    required this.tag,
    required this.id,
    required this.posterPath,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(id));
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Hero(
              tag: tag,
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(
                    12,
                  ),
                  child: Image.network(
                    posterPath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            if (state.movieDetail != null) ...[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          state.movieDetail!.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          state.movieDetail!.releaseDate,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Text(state.movieDetail!.tagLine),
                    Text('${state.movieDetail!.runTime} 분'),
                    SizedBox(height: 10),
                    line(),
                    Category(genres: state.movieDetail!.genres),
                    line(),
                    SizedBox(height: 5),
                    Text(state.movieDetail!.overView),
                    SizedBox(height: 5),
                    line(),
                    SizedBox(height: 20),
                    Text(
                      '흥행정보',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    BoxOfficeInfo(state: state.movieDetail!),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.movieDetail!.companies.length,
                        itemBuilder: (context, index) {
                          if (state
                              .movieDetail!
                              .companies[index]
                              .isEmpty) {
                            return SizedBox.square();
                          }
                          return Row(
                            children: [
                              SizedBox(
                                height: 80,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original${state.movieDetail!.companies[index]}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
