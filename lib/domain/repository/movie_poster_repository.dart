import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';

abstract interface class MoviePosterRepository {
  Future<List<MoivePoster>?> getNowPlayingMovie();
  Future<List<MoivePoster>?> getPopularMovie();
  Future<List<MoivePoster>?> getTopRatedMovie();
  Future<List<MoivePoster>?> getUpcomingMovie();
  Future<MovieDetail?> getDetailMovie(int id);
}
