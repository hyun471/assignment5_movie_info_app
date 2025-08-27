import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:assignment5_movie_info_app/presentation/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 디테일 상태 클래스
class DetailState {
  DetailState({required this.movieDetail});
  MovieDetail? movieDetail;
}

/// 디테일 뷰모델
class DetailViewModel
    extends AutoDisposeFamilyNotifier<DetailState, int> {
  @override
  DetailState build(int id) {
    fetchMovieDetail(id);
    return DetailState(movieDetail: null);
  }

  /// 해당 영화 상세 정보 불러오기
  Future<void> fetchMovieDetail(int id) async {
    final detail = ref.read(fetchMoviesUsecaseProvider);
    final result = await detail.getDetailMovie(id);
    state = DetailState(movieDetail: result);
  }
}

/// 디테일 뷰모델 상태 관리자
final detailViewModelProvider =
    AutoDisposeNotifierProvider.family<
      DetailViewModel,
      DetailState,
      int
    >(() {
      return DetailViewModel();
    });
