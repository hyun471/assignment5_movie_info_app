import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/presentation/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState({
    this.nowPlaying = const [],
    this.popular = const [],
    this.topRated = const [],
    this.upComing = const [],
  });
  List<MoivePoster> nowPlaying;
  List<MoivePoster> popular;
  List<MoivePoster> topRated;
  List<MoivePoster> upComing;

  HomeState copyWith({
    List<MoivePoster>? nowPlaying,
    List<MoivePoster>? popular,
    List<MoivePoster>? topRated,
    List<MoivePoster>? upComing,
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
    final nowPlaying = ref.read(fetchMoviesUsecaseProvider);
    final result = await nowPlaying.getNowPlayingMovie();
    state = state.copyWith(nowPlaying: result);
  }

  Future<void> fetchPopular() async {
    final popular = ref.read(fetchMoviesUsecaseProvider);
    final result = await popular.getPopularMovie();
    state = state.copyWith(popular: result);
  }

  Future<void> fetchTopRated() async {
    final topRated = ref.read(fetchMoviesUsecaseProvider);
    final result = await topRated.getTopRatedMovie();
    state = state.copyWith(topRated: result);
  }

  Future<void> fetchUpComing() async {
    final upComing = ref.read(fetchMoviesUsecaseProvider);
    final result = await upComing.getUpcomingMovie();
    state = state.copyWith(upComing: result);
  }
}

final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() {
      return HomeViewModel();
    });
