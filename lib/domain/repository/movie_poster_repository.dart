import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';

/// 구현체가 참조할 클래스
abstract interface class MoviePosterRepository {
  Future<List<MoviePoster>?> getNowPlayingMovie(int page);
  Future<List<MoviePoster>?> getPopularMovie(int page);
  Future<List<MoviePoster>?> getTopRatedMovie(int page);
  Future<List<MoviePoster>?> getUpcomingMovie(int page);
  Future<MovieDetail?> getDetailMovie(int id);
}
