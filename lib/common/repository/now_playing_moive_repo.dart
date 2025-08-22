import 'dart:convert';
import 'package:assignment5_movie_info_app/common/models/moive_poster_model.dart';
import 'package:assignment5_movie_info_app/common/models/secret.dart';
import 'package:http/http.dart';

// {
//   "dates": {
//     "maximum": "2025-09-17",
//     "minimum": "2025-08-27"
//   },
//   "page": 1,
//   "results": [
//     {
//       "adult": false,
//       "backdrop_path": "/1RgPyOhN4DRs225BGTlHJqCudII.jpg",
//       "genre_ids": [
//         16,
//         28,
//         14,
//         53
//       ],
//       "id": 1311031,
//       "original_language": "ja",
//       "original_title": "劇場版「鬼滅の刃」無限城編 第一章 猗窩座再来",
//       "overview": "The Demon Slayer Corps are drawn into the Infinity Castle, where Tanjiro, Nezuko, and the Hashira face terrifying Upper Rank demons in a desperate fight as the final battle against Muzan Kibutsuji begins.",
//       "popularity": 299.5512,
//       "poster_path": "/aFRDH3P7TX61FVGpaLhKr6QiOC1.jpg",
//       "release_date": "2025-07-18",
//       "title": "Demon Slayer: Kimetsu no Yaiba Infinity Castle",
//       "video": false,
//       "vote_average": 7.127,
//       "vote_count": 83
//     },

class NowPlayingMoiveRepo {
  Future<List<MoivePosterModel>?> getNowPlayingMovie() async {
    String myKey = TMDBKey;
    final client = Client();
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$myKey&page=1',
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
