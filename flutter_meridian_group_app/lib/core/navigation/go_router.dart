import 'package:flutter_meridian_group_app/views/list_movies/view/list_movies_view.dart';
import 'package:go_router/go_router.dart';
import '../../views/splash/view/splash_view.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      SplashViewRoute(),
      ListMoviesViewRoute()
    ],
  );
}
