import 'dart:convert';
import 'package:assignment5_movie_info_app/data/data_source/movie_list_data_source.dart';
import 'package:assignment5_movie_info_app/data/dto/moive_list_dto.dart';
import 'package:assignment5_movie_info_app/data/dto/movie_detail_dto.dart';
import 'package:assignment5_movie_info_app/data/secret.dart';
import 'package:http/http.dart';

class MovieListDataSourceImpl implements MovieListDataSource {
  // MovieListDataSourceImpl(this._movies);

  Client client = Client();

  @override
  Future<List<MoiveListDto>?> getNowPlayingMovie(
    int page,
  ) async {
    String myKey = myTMDBKey;
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$myKey&page=$page',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final movies = List.from(map["results"]);
      final iterable = movies.map((e) {
        return MoiveListDto.fromJson(e);
      });
      final result = iterable.toList();
      return result;
    }
    print(response.statusCode);
    return [];
  }

  @override
  Future<List<MoiveListDto>?> getPopularMovie(int page) async {
    String myKey = myTMDBKey;
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$myKey&page=$page',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final movies = List.from(map["results"]);
      final iterable = movies.map((e) {
        return MoiveListDto.fromJson(e);
      });
      final result = iterable.toList();
      return result;
    }
    print(response.statusCode);
    return [];
  }

  @override
  Future<List<MoiveListDto>?> getTopRatedMovie(int page) async {
    String myKey = myTMDBKey;
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$myKey&page=$page',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final movies = List.from(map["results"]);
      final iterable = movies.map((e) {
        return MoiveListDto.fromJson(e);
      });
      final result = iterable.toList();
      return result;
    }
    print(response.statusCode);
    return [];
  }

  @override
  Future<List<MoiveListDto>?> getUpcomingMovie(int page) async {
    String myKey = myTMDBKey;
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$myKey&page=$page',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final movies = List.from(map["results"]);
      final iterable = movies.map((e) {
        return MoiveListDto.fromJson(e);
      });
      final result = iterable.toList();
      return result;
    }
    print(response.statusCode);
    return [];
  }

  @override
  Future<MovieDetailDto?> getDetailMovie(int id) async {
    String myKey = myTMDBKey;
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=$myKey&page=1',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return MovieDetailDto.fromJson(map);
    }
    print(response.statusCode);
    return null;
  }
}
