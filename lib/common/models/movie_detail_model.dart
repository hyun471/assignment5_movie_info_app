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

class MovieDetailModel {
  MovieDetailModel({
    required this.id,
    required this.title,
    required this.tagLine,
    required this.releaseDate,
    required this.runTime,
    required this.genres,
    required this.overView,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.revenue,
    required this.companies,
  });
  final String id;
  final String title;
  final String tagLine;
  final String releaseDate;
  final String runTime;
  final List<String> genres;
  final String overView;
  final String voteAverage;
  final String voteCount;
  final String popularity;
  final String revenue;
  final List<String> companies;

  MovieDetailModel.fromJson(Map<String, dynamic> map)
    : this(
        id: map['id'].toString(),
        title: map['title'],
        tagLine: map['tagline'],
        releaseDate: map['release_date'],
        runTime: map['runtime'].toString(),
        genres: List<String>.from(
          (map['genres'] as List).map((g) => g['name']),
        ),
        overView: map['overview'],
        voteAverage: map['vote_average'].toString(),
        voteCount: map['vote_count'].toString(),
        popularity: map['popularity'].toString(),
        revenue: map['revenue'].toString(),
        companies: List<String>.from(
          (map['production_companies'] as List).map(
            (g) => g['logo_path'],
          ),
        ),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'tagline': tagLine,
      'release_date': releaseDate,
      'runtime': runTime,
      'genres': genres,
      'overview': overView,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'popularity': popularity,
      'revenue': revenue,
      'production_companies': companies,
    };
  }
}
