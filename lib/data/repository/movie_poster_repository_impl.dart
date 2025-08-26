import 'package:assignment5_movie_info_app/data/data_source/movie_list_data_source.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/domain/entity/movie_poster.dart';
import 'package:assignment5_movie_info_app/domain/repository/movie_poster_repository.dart';

class MoviePosterRepositoryImpl
    implements MoviePosterRepository {
  MoviePosterRepositoryImpl(this._movieListDataSource);
  final MovieListDataSource _movieListDataSource;

  @override
  Future<List<MoivePoster>> getNowPlayingMovie() async {
    final result = await _movieListDataSource
        .getNowPlayingMovie();
    return result!
        .map(
          (e) => MoivePoster(
            id: e.id.toString(),
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<MoivePoster>> getPopularMovie() async {
    final result = await _movieListDataSource.getPopularMovie();
    return result!
        .map(
          (e) => MoivePoster(
            id: e.id.toString(),
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<MoivePoster>> getTopRatedMovie() async {
    final result = await _movieListDataSource.getTopRatedMovie();
    return result!
        .map(
          (e) => MoivePoster(
            id: e.id.toString(),
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<MoivePoster>> getUpcomingMovie() async {
    final result = await _movieListDataSource.getUpcomingMovie();
    return result!
        .map(
          (e) => MoivePoster(
            id: e.id.toString(),
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<MovieDetail?> getDetailMovie(int id) async {
    final result = await _movieListDataSource.getDetailMovie(id);
    return MovieDetail(
      id: result!.id.toString(),
      title: result.title,
      tagLine: result.tagline,
      releaseDate: result.releaseDate,
      runTime: result.runtime.toString(),
      genres: result.genres.map((e) => e.name).toList(),

      overView: result.overview,
      voteAverage: result.voteAverage.toString(),
      voteCount: result.voteCount.toString(),
      popularity: result.popularity.toString(),
      revenue: result.revenue.toString(),
      companies: result.productionCompanies
          .map((e) => e.logoPath ?? "")
          .toList(),
      posterPath: result.posterPath,
      budget: result.budget.toString(),
    );
  }
}
