import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/presentation/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 상태 클래스
class HomeState {
  HomeState({
    required this.nowPlaying,
    required this.popular,
    required this.topRated,
    required this.upComing,
  });
  List<MoviePoster> nowPlaying;
  List<MoviePoster> popular;
  List<MoviePoster> topRated;
  List<MoviePoster> upComing;

  /// 상태를 재사용 해주는 메서드
  HomeState copyWith({
    List<MoviePoster>? nowPlaying,
    List<MoviePoster>? popular,
    List<MoviePoster>? topRated,
    List<MoviePoster>? upComing,
  }) {
    return HomeState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upComing: upComing ?? this.upComing,
    );
  }
}

/// 뷰모델 클래스
class HomeViewModel extends Notifier<HomeState> {
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

  /// 현재 상영중 리스트 불러오기
  Future<void> fetchNowPlaying() async {
    final nowPlayingRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await nowPlayingRepo.getNowPlayingMovie(1);
    state = state.copyWith(nowPlaying: result);
  }

  /// 인기순 리스트 불러오기
  Future<void> fetchPopular() async {
    final popularRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await popularRepo.getPopularMovie(1);
    state = state.copyWith(popular: result);
  }

  /// 평점 높은순 리스트 불러오기
  Future<void> fetchTopRated() async {
    final topRatedRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await topRatedRepo.getTopRatedMovie(1);
    state = state.copyWith(topRated: result);
  }

  /// 개봉예정 리스트 불러오기
  Future<void> fetchUpComing() async {
    final upComingRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await upComingRepo.getUpcomingMovie(1);
    state = state.copyWith(upComing: result);
  }

  /// 추가적인 인기순 정보를 불러오는 메서드
  Future<void> fetchNewPopular() async {
    page++;
    final popularRepo = ref.read(fetchMoviesUsecaseProvider);
    final result = await popularRepo.getPopularMovie(page);
    state = state.copyWith(
      popular: [...state.popular, ...result!],
    );
  }
}

/// 홈 뷰모델 상태 관리자
final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() {
      return HomeViewModel();
    });
