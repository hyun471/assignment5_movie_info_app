import 'package:assignment5_movie_info_app/common/models/movie_detail_model.dart';
import 'package:assignment5_movie_info_app/common/repository/movie_detail_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailState {
  DetailState({required this.movieDetail});
  MovieDetailModel? movieDetail;
}

class DetailViewModel
    extends FamilyNotifier<DetailState, String> {
  @override
  DetailState build(id) {
    fetchMovieDetail(id);
    return DetailState(movieDetail: null);
  }

  Future<void> fetchMovieDetail(id) async {
    final detailRepo = MovieDetailRepo();
    final result = await detailRepo.getDetailMovie(id);
    state = DetailState(movieDetail: result);
  }
}

final detailViewModelProvider =
    NotifierProvider.family<
      DetailViewModel,
      DetailState,
      String
    >(() {
      return DetailViewModel();
    });
