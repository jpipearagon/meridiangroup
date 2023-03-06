import '../../../core/model_base/state_data.dart';

class SplashData extends StateData {
  const SplashData({
    required this.showSplash
  });

  const SplashData.initial()
      : showSplash = false;

  final bool showSplash;

  @override
  List<Object?> get props => [
        showSplash,
      ];
}