import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/presentation/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailState {
  DetailState({required this.movieDetail});
  MovieDetail? movieDetail;
}

class DetailViewModel
    extends AutoDisposeFamilyNotifier<DetailState, int> {
  @override
  DetailState build(int id) {
    fetchMovieDetail(id);
    return DetailState(movieDetail: null);
  }

  Future<void> fetchMovieDetail(int id) async {
    final detail = ref.read(fetchMoviesUsecaseProvider);
    final result = await detail.getDetailMovie(id);
    state = DetailState(movieDetail: result);
  }
}

final detailViewModelProvider =
    AutoDisposeNotifierProvider.family<
      DetailViewModel,
      DetailState,
      int
    >(() {
      return DetailViewModel();
    });
