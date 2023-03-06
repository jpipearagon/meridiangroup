import 'package:flutter_meridian_group_app/views/list_movies/model/movie_model.dart';
import '../../../core/model_base/state_data.dart';

class ListMoviesData extends StateData {
  const ListMoviesData({
    required this.listMovie,
    required this.showEmpty,
    required this.showLoading
  });

  const ListMoviesData.initial()
      : listMovie = const [],
      showEmpty = false,
      showLoading = false;

  final List<MovieModel> listMovie;
  final bool showEmpty;
  final bool showLoading;

  @override
  List<Object?> get props => [
    listMovie,
    showEmpty,
    showLoading
  ];
}