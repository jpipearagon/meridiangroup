import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/image_base/image_constatns.dart';
import '../../../core/navigation/app_route.dart';
import '../../../core/widget/screen_view.dart';
import '../../list_movies/view/list_movies_view.dart';
import '../model/splash_model.dart';
import '../view_model/splash_view_model.dart';

class SplashViewRoute extends AppRoute {
  SplashViewRoute()
      : super(
          path: '/',
          builder: (context, state) => SplashView(key: state.pageKey),
        );
}

class SplashView extends ScreenView {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState
    extends ScreenViewState<SplashView, SplashViewModel, SplashData> {
  

  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  void loadSplash() async{
    await viewModel.delaySplash();
    SchedulerBinding.instance.addPostFrameCallback((_) {
        ListMoviesViewRoute().push(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _TitleLogoWidget()
      ),
    );
  }
}

class _TitleLogoWidget extends StatelessWidget {
  const _TitleLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<SplashData, bool>(
      selector: (_, data) => data.showSplash,
      builder: (context, showLoading, _) => Visibility(
        visible: showLoading,
        child: Stack(
          children: [
            buildCenterTextWelcome(),
            buildAnimatedAlignIcon(),
          ],
        ),
      ),
    );
  }

  Widget buildCenterTextWelcome() {
    return Center(
      child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Splash",
                  textAlign: TextAlign.center,
                ),
                const CircularProgressIndicator.adaptive()
              ],
            ),
        ),
    );
  }

  Widget buildAnimatedAlignIcon() {
    return AnimatedAlign(
          alignment: Alignment.center,
          duration: const Duration(seconds: 3),
          child: Image.asset(ImageConstants.instance.logo),
        );
  }
}