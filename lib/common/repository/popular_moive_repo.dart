import 'dart:convert';
import 'package:assignment5_movie_info_app/common/models/moive_poster_model.dart';
import 'package:assignment5_movie_info_app/common/models/secret.dart';
import 'package:http/http.dart';

class PopularMoiveRepo {
  Future<List<MoivePosterModel>?> getPopularMovie() async {
    String myKey = TMDBKey;
    final client = Client();
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$myKey&page=1',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final movies = List.from(map["results"]);
      final iterable = movies.map((e) {
        return MoivePosterModel.fromJson(e);
      });
      final movieList = iterable.toList();
      return movieList;
    }
    print(response.statusCode);
    return [];
  }
}
