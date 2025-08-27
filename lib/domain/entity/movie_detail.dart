/// 디테일 페이지에서 사용될 정보에 대한 모델
class MovieDetail {
  MovieDetail({
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
    required this.posterPath,
    required this.budget,
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
  final String posterPath;
  final String budget;
}
