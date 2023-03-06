
import '../../../core/model_base/state_data.dart';

class ListMoviesData extends StateData {
  const ListMoviesData({
    required this.showSplash
  });

  const ListMoviesData.initial()
      : showSplash = false;

  final bool showSplash;

  @override
  List<Object?> get props => [
        showSplash,
      ];
}