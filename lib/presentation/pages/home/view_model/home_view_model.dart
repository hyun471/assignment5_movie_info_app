import 'package:assignment5_movie_info_app/data/dto/moive_list_dto.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/presentation/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState({
    required this.nowPlaying,
    required this.popular,
    required this.topRated,
    required this.upComing,
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
  // final List<MoivePoster> nowPlaying = [];
  // final List<MoivePoster> popular = [];
  // final List<MoivePoster> topRated = [];
  // final List<MoivePoster> upComing = [];
  int page = 1;

  @override
  HomeState build() {
    fetchNowPlaying();
    fetchPopular();
    fetchTopRated();
    fetchUpComing();
    return HomeState(
      nowPlaying: [],
      popular: [],
      topRated: [],
      upComing: [],
    );
  }

  Future<void> fetchNowPlaying() async {
    final nowPlayingRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await nowPlayingRepo.getNowPlayingMovie(1);
    state = state.copyWith(nowPlaying: result);
  }

  Future<void> fetchPopular() async {
    final popularRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await popularRepo.getPopularMovie(1);
    state = state.copyWith(popular: result);
  }

  Future<void> fetchTopRated() async {
    final topRatedRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await topRatedRepo.getTopRatedMovie(1);
    state = state.copyWith(topRated: result);
  }

  Future<void> fetchUpComing() async {
    final upComingRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await upComingRepo.getUpcomingMovie(1);
    state = state.copyWith(upComing: result);
  }

  Future<void> fetchNewPopular() async {
    page++;
    final popularRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await popularRepo.getPopularMovie(page);
    state = state.copyWith(
      popular: [...state.popular, ...result!],
    );
  }
}

final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() {
      return HomeViewModel();
    });
