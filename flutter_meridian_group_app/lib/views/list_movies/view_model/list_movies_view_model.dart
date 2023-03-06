import 'dart:async';
import 'package:injectable/injectable.dart';
import '../../../core/view_model_base/view_model.dart';
import '../model/list_movies_model.dart';
import '../model/movie_model.dart';
import '../repository/list_movies_repo.dart';

@injectable
class ListMoviesViewModel extends ViewModel<ListMoviesData> {
  ListMoviesViewModel() : super(const ListMoviesData.initial());

  final _repoListMovies = ListMovieRepo();

  Future<void> init() async {
      _updateState(showLoading: true);
      final list = await _repoListMovies.getListMovies();
      _updateState(showLoading: false);
      if(list != null) {
        _updateState(isEmpty: false);
        _updateState(listMovies: list.results);
      } else {
        _updateState(isEmpty: true);
      }
  }

  void _updateState({
    List<MovieModel>? listMovies,
    bool isEmpty = false,
    bool showLoading = false,
  }) {
    listMovies ??= value.listMovie;

    stateData = ListMoviesData(
      listMovie: listMovies,
      showEmpty: isEmpty,
      showLoading: showLoading
    );
  }
}
