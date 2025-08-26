import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';

abstract interface class MoviePosterRepository {
  Future<List<MoivePoster>?> getNowPlayingMovie(int page);
  Future<List<MoivePoster>?> getPopularMovie(int page);
  Future<List<MoivePoster>?> getTopRatedMovie(int page);
  Future<List<MoivePoster>?> getUpcomingMovie(int page);
  Future<MovieDetail?> getDetailMovie(int id);
}
