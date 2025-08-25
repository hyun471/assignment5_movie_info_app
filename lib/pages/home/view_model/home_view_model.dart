import 'package:assignment5_movie_info_app/common/models/moive_poster_model.dart';
import 'package:assignment5_movie_info_app/common/repository/now_playing_moive_repo.dart';
import 'package:assignment5_movie_info_app/common/repository/popular_moive_repo.dart';
import 'package:assignment5_movie_info_app/common/repository/top_rated_movie_repo.dart';
import 'package:assignment5_movie_info_app/common/repository/upcoming_movie_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState({
    this.nowPlaying = const [],
    this.popular = const [],
    this.topRated = const [],
    this.upComing = const [],
  });
  List<MoivePosterModel> nowPlaying;
  List<MoivePosterModel> popular;
  List<MoivePosterModel> topRated;
  List<MoivePosterModel> upComing;

  HomeState copyWith({
    List<MoivePosterModel>? nowPlaying,
    List<MoivePosterModel>? popular,
    List<MoivePosterModel>? topRated,
    List<MoivePosterModel>? upComing,
  }) {
    return HomeState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upComing: upComing ?? this.upComing,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    Future.microtask(() {
      fetchNowPlaying();
      fetchPopular();
      fetchTopRated();
      fetchUpComing();
    });
    return HomeState();
  }

  Future<void> fetchNowPlaying() async {
    final nowPlayingRepo = NowPlayingMoiveRepo();
    final result = await nowPlayingRepo.getNowPlayingMovie();
    print('get now Playing : ${result?.length}');
    state = state.copyWith(nowPlaying: result);
  }

  Future<void> fetchPopular() async {
    final popularRepo = PopularMoiveRepo();
    final result = await popularRepo.getPopularMovie();
    state = state.copyWith(popular: result);
  }

  Future<void> fetchTopRated() async {
    final topRatedRepo = TopRatedMovieRepo();
    final result = await topRatedRepo.getTopRatedMovie();
    state = state.copyWith(topRated: result);
  }

  Future<void> fetchUpComing() async {
    final upComingRepo = UpcomingMovieRepo();
    final result = await upComingRepo.getUpcomingMovie();
    state = state.copyWith(upComing: result);
  }
}

final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() {
      return HomeViewModel();
    });
