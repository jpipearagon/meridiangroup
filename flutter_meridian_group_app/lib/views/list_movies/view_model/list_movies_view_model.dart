

import 'package:injectable/injectable.dart';
import '../../../core/view_model_base/view_model.dart';
import '../model/list_movies_model.dart';

@injectable
class ListMoviesViewModel extends ViewModel<ListMoviesData> {
  ListMoviesViewModel() : super(const ListMoviesData.initial());


  Future<void> delaySplash() async {
    _updateState(showSplash: true);
    await Future.delayed(const Duration(seconds: 3));
  }

  void _updateState({
    bool showSplash = false,
  }) {
    stateData = ListMoviesData(
      showSplash: showSplash
    );
  }
}
