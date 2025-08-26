import 'package:assignment5_movie_info_app/presentation/pages/home/view_model/home_view_model.dart';
import 'package:assignment5_movie_info_app/presentation/pages/home/views/most_popular_movie.dart';
import 'package:assignment5_movie_info_app/presentation/pages/home/views/movie_list.dart';
import 'package:assignment5_movie_info_app/presentation/pages/home/views/thumbnail_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  double thumbnailHeight = 150;
  double thumbnailWidth = 100;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));

          ref
              .read(homeViewModelProvider.notifier)
              .fetchNowPlaying();
          ref
              .read(homeViewModelProvider.notifier)
              .fetchPopular();
          ref
              .read(homeViewModelProvider.notifier)
              .fetchTopRated();
          ref
              .read(homeViewModelProvider.notifier)
              .fetchUpComing();
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              state.nowPlaying.isEmpty ||
                  state.popular.isEmpty ||
                  state.topRated.isEmpty ||
                  state.upComing.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        // 가장 인기있는 영화
                        Text('가장 인기있는'),
                        SizedBox(height: 10),
                        MostPopular(state: state.popular.first),
                        // 현재 상영중인 영화 리스트
                        SizedBox(height: 10),
                        Text('현재 상영중'),
                        SizedBox(height: 10),
                        MovieList(
                          thumbnailHeight: thumbnailHeight,
                          thumbnailWidth: thumbnailWidth,
                          state: state.nowPlaying,
                          category: '가장 인기있는',
                        ),
                        // 인기 있는 영화 리스트
                        SizedBox(height: 10),
                        Text('인기 순'),
                        SizedBox(height: 10),
                        PopularWidget(
                          thumbnailHeight: thumbnailHeight,
                          ref: ref,
                          state: state,
                          thumbnailWidth: thumbnailWidth,
                        ),
                        // 평정 높은 영화 리스트
                        SizedBox(height: 10),
                        Text('평점 높은순'),
                        MovieList(
                          thumbnailHeight: thumbnailHeight,
                          thumbnailWidth: thumbnailWidth,
                          state: state.topRated,
                          category: '평점 높은순',
                        ),
                        // 개봉 예정인 영화 리스트
                        SizedBox(height: 10),
                        Text('개봉예정'),
                        SizedBox(height: 10),
                        MovieList(
                          thumbnailHeight: thumbnailHeight,
                          thumbnailWidth: thumbnailWidth,
                          state: state.upComing,
                          category: '개봉예정',
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    super.key,
    required this.thumbnailHeight,
    required this.ref,
    required this.state,
    required this.thumbnailWidth,
  });

  final double thumbnailHeight;
  final WidgetRef ref;
  final HomeState state;
  final double thumbnailWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: thumbnailHeight,
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent) {
              ref
                  .read(homeViewModelProvider.notifier)
                  .fetchNewPopular();
            }
          }
          return false;
        },
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
                        alignment: Alignment.centerRight,
                        child: ThumbnailBox(
                          thumbnailHeight: thumbnailHeight,
                          thumbnailWidth: thumbnailWidth,
                          state: state.popular[index],
                          categroy: '인기 순',
                          index: index,
                        ),
                      ),
                      Positioned(
                        left: -5,
                        bottom: -15,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
    );
  }
}
