// {
//   "adult": false,
//   "backdrop_path": "/jvpkBenB6hv19WWYVlaiow8zklq.jpg",
//   "belongs_to_collection": {
//     "id": 1231053,
//     "name": "The Bad Guys Collection",
//     "poster_path": "/MvnERW28KnZ5fmxS73a27m3qhN.jpg",
//     "backdrop_path": "/i3CknOVjxNEbTJnaX3ryyTeCYxn.jpg"
//   },
//   "budget": 80000000,
//   "genres": [
//     {
//       "id": 16,
//       "name": "Animation"
//     },
//     {
//       "id": 10751,
//       "name": "Family"
//     },
//     {
//       "id": 35,
//       "name": "Comedy"
//     },
//     {
//       "id": 80,
//       "name": "Crime"
//     },
//     {
//       "id": 12,
//       "name": "Adventure"
//     }
//   ],
//   "homepage": "https://www.thebadguysmovie.com",
//   "id": 1175942,
//   "imdb_id": "tt30017619",
//   "origin_country": [
//     "US"
//   ],
//   "original_language": "en",
//   "original_title": "The Bad Guys 2",
//   "overview": "The now-reformed Bad Guys are trying (very, very hard) to be good, but instead find themselves hijacked into a high-stakes, globe-trotting heist, masterminded by a new team of criminals they never saw coming: The Bad Girls.",
//   "popularity": 259.9671,
//   "poster_path": "/26oSPnq0ct59l07QOXZKyzsiRtN.jpg",
//   "production_companies": [
//     {
//       "id": 521,
//       "logo_path": "/3BPX5VGBov8SDqTV7wC1L1xShAS.png",
//       "name": "DreamWorks Animation",
//       "origin_country": "US"
//     }
//   ],
//   "production_countries": [
//     {
//       "iso_3166_1": "US",
//       "name": "United States of America"
//     }
//   ],
//   "release_date": "2025-07-24",
//   "revenue": 126741295,
//   "runtime": 104,
//   "spoken_languages": [
//     {
//       "english_name": "English",
//       "iso_639_1": "en",
//       "name": "English"
//     },
//     {
//       "english_name": "Spanish",
//       "iso_639_1": "es",
//       "name": "Español"
//     }
//   ],
//   "status": "Released",
//   "tagline": "Back in badness.",
//   "title": "The Bad Guys 2",
//   "video": false,
//   "vote_average": 7.879,
//   "vote_count": 149
// }

import 'dart:convert';
import 'package:assignment5_movie_info_app/common/models/movie_detail_model.dart';
import 'package:assignment5_movie_info_app/common/models/secret.dart';
import 'package:http/http.dart';

class MovieDetailRepo {
  Future<MovieDetailModel?> getDetailMovie(String id) async {
    String myKey = TMDBKey;
    final client = Client();
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=$myKey&page=1',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return MovieDetailModel.fromJson(map);
    }
    print(response.statusCode);
    return null;
  }
}
