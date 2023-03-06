import 'package:injectable/injectable.dart';
import '../../../core/view_model_base/view_model.dart';
import '../model/splash_model.dart';

@injectable
class SplashViewModel extends ViewModel<SplashData> {
  SplashViewModel() : super(const SplashData.initial());


  Future<void> delaySplash() async {
    _updateState(showSplash: true);
    await Future.delayed(const Duration(seconds: 3));
  }

  void _updateState({
    bool showSplash = false,
  }) {
    stateData = SplashData(
      showSplash: showSplash
    );
  }
}
