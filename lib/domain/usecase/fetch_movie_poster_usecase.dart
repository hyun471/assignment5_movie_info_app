import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/domain/repository/movie_poster_repository.dart';

class FetchMoviePosterUsecase {
  FetchMoviePosterUsecase(this._moviePosterRepository);
  final MoviePosterRepository _moviePosterRepository;

  Future<List<MoivePoster>?> getNowPlayingMovie() async {
    return await _moviePosterRepository.getNowPlayingMovie();
  }

  Future<List<MoivePoster>?> getPopularMovie() async {
    return await _moviePosterRepository.getPopularMovie();
  }

  Future<List<MoivePoster>?> getTopRatedMovie() async {
    return await _moviePosterRepository.getTopRatedMovie();
  }

  Future<List<MoivePoster>?> getUpcomingMovie() async {
    return await _moviePosterRepository.getUpcomingMovie();
  }

  Future<MovieDetail?> getDetailMovie(int id) async {
    return await _moviePosterRepository.getDetailMovie(id);
  }
}
