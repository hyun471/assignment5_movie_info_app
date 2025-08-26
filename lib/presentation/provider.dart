import 'package:assignment5_movie_info_app/data/data_source/movie_list_data_source.dart';
import 'package:assignment5_movie_info_app/data/data_source/movie_list_data_source_Impl.dart';
import 'package:assignment5_movie_info_app/data/repository/movie_poster_repository_impl.dart';
import 'package:assignment5_movie_info_app/domain/repository/movie_poster_repository.dart';
import 'package:assignment5_movie_info_app/domain/usecase/fetch_movie_poster_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieDataSourceProvider = Provider<MovieListDataSource>((
  ref,
) {
  return MovieListDataSourceImpl();
});

final _moviePosterRepositoryProvider =
    Provider<MoviePosterRepository>((ref) {
      final dataSource = ref.read(_movieDataSourceProvider);
      return MoviePosterRepositoryImpl(dataSource);
    });

final fetchMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_moviePosterRepositoryProvider);
  return FetchMoviePosterUsecase(movieRepo);
});
