import 'package:assignment5_movie_info_app/pages/detail/detail_page.dart';
import 'package:assignment5_movie_info_app/pages/home/view_model/home_view_model.dart';
import 'package:assignment5_movie_info_app/pages/home/views/movie_list.dart';
import 'package:assignment5_movie_info_app/pages/home/views/thumbnail_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  double thumbnailHeight = 150;

  double thumbnailWidth = 100;

  @override
  Widget build(BuildContext context) {
    final state = ref.read(homeViewModelProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child:
            state.nowPlaying.isEmpty &&
                state.popular.isEmpty &&
                state.topRated.isEmpty &&
                state.upComing.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 가장 인기있는 영화
                      Text('가장 인기있는'),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          // TODO 나중에 수정
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(),
                            ),
                          );
                        },
                        child: Hero(
                          tag: state.popular.first.id,
                          child: SizedBox(
                            width: double.infinity,
                            height: 560,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadiusGeometry.circular(
                                    12,
                                  ),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w300${state.popular.first.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // 현재 상영중인 영화 리스트
                      SizedBox(height: 5),
                      Text('현재 상영중'),
                      SizedBox(height: 5),
                      MovieList(
                        thumbnailHeight: thumbnailHeight,
                        thumbnailWidth: thumbnailWidth,
                        state: state.nowPlaying,
                      ),
                      // 인기 있는 영화 리스트
                      SizedBox(height: 5),
                      Text('인기 순'),
                      SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: thumbnailHeight,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.popular.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: thumbnailWidth + 20,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment
                                            .centerRight,
                                        child: ThumbnailBox(
                                          thumbnailHeight:
                                              thumbnailHeight,
                                          thumbnailWidth:
                                              thumbnailWidth,
                                          state: state
                                              .popular[index],
                                        ),
                                      ),
                                      Positioned(
                                        left: -5,
                                        bottom: -15,
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                            fontSize: 80,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                index != state.popular.length - 1
                                    ? SizedBox(width: 10)
                                    : SizedBox.shrink(),
                              ],
                            );
                          },
                        ),
                      ),
                      // 평정 높은 영화 리스트
                      SizedBox(height: 5),
                      Text('평점 높은순'),
                      MovieList(
                        thumbnailHeight: thumbnailHeight,
                        thumbnailWidth: thumbnailWidth,
                        state: state.topRated,
                      ),
                      // 개봉 예정인 영화 리스트
                      SizedBox(height: 5),
                      Text('개봉예정'),
                      SizedBox(height: 5),
                      MovieList(
                        thumbnailHeight: thumbnailHeight,
                        thumbnailWidth: thumbnailWidth,
                        state: state.upComing,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
