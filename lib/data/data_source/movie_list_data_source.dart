import 'package:assignment5_movie_info_app/data/dto/moive_list_dto.dart';
import 'package:assignment5_movie_info_app/data/dto/movie_detail_dto.dart';

abstract interface class MovieListDataSource {
  Future<List<MoiveListDto>?> getNowPlayingMovie();
  Future<List<MoiveListDto>?> getPopularMovie();
  Future<List<MoiveListDto>?> getTopRatedMovie();
  Future<List<MoiveListDto>?> getUpcomingMovie();
  Future<MovieDetailDto?> getDetailMovie(int id);
}
