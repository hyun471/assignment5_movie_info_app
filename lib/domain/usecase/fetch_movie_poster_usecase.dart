import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/domain/repository/movie_poster_repository.dart';

class FetchMoviePosterUsecase {
  FetchMoviePosterUsecase(this._moviePosterRepository);
  final MoviePosterRepository _moviePosterRepository;

  Future<List<MoivePoster>?> getNowPlayingMovie(int page) async {
    return await _moviePosterRepository.getNowPlayingMovie(page);
  }

  Future<List<MoivePoster>?> getPopularMovie(int page) async {
    return await _moviePosterRepository.getPopularMovie(page);
  }

  Future<List<MoivePoster>?> getTopRatedMovie(int page) async {
    return await _moviePosterRepository.getTopRatedMovie(page);
  }

  Future<List<MoivePoster>?> getUpcomingMovie(int page) async {
    return await _moviePosterRepository.getUpcomingMovie(page);
  }

  Future<MovieDetail?> getDetailMovie(int id) async {
    return await _moviePosterRepository.getDetailMovie(id);
  }
}
