import 'package:assignment5_movie_info_app/common/models/moive_poster_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState(this.movies);
  List<MoivePosterModel> movies;
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }
}
