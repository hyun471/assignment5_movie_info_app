import 'package:assignment5_movie_info_app/data/dto/moive_list_dto.dart';
import 'package:assignment5_movie_info_app/data/dto/movie_detail_dto.dart';

abstract interface class MovieListDataSource {
  Future<List<MoiveListDto>?> getNowPlayingMovie(int page);
  Future<List<MoiveListDto>?> getPopularMovie(int page);
  Future<List<MoiveListDto>?> getTopRatedMovie(int page);
  Future<List<MoiveListDto>?> getUpcomingMovie(int page);
  Future<MovieDetailDto?> getDetailMovie(int id);
}
