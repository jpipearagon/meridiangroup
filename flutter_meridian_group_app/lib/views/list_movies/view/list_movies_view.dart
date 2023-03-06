import 'package:flutter/material.dart';

import '../../../core/navigation/app_route.dart';
import '../../../core/widget/screen_view.dart';
import '../model/list_movies_model.dart';
import '../view_model/list_movies_view_model.dart';

class ListMoviesViewRoute extends AppRoute {
  ListMoviesViewRoute()
      : super(
          path: '/list_movies',
          builder: (context, state) => ListMoviesView(key: state.pageKey),
        );
}

class ListMoviesView extends ScreenView {
  const ListMoviesView({Key? key}) : super(key: key);

  @override
  _ListMoviesViewState createState() => _ListMoviesViewState();
}

class _ListMoviesViewState
    extends ScreenViewState<ListMoviesView, ListMoviesViewModel, ListMoviesData> {
  

  @override
  Widget buildScreen(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Text("Hola")
      ),
    );
  }
}