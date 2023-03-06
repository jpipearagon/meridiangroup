import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/image_base/image_constatns.dart';
import '../../../core/navigation/app_route.dart';
import '../../../core/widget/screen_view.dart';
import '../model/list_movies_model.dart';
import '../model/movie_model.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.init();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Movies"),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: const Stack(
        fit: StackFit.expand,
        children: [
          _ListMoviewView(),
          const _LoadingView(),
          const _EmptyState(),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ListMoviesData, bool>(
      selector: (_, data) => data.showEmpty,
      builder: (context, showEmptyState, _) => Visibility(
        visible: showEmptyState,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Empty List Movies',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ListMoviesData, bool>(
      selector: (_, data) => data.showLoading,
      builder: (context, showLoading, _) => Visibility(
        visible: showLoading,
        child: Container(
          child: Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              height: 100.0,
              width: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _ListMoviewView extends StatelessWidget {
  const _ListMoviewView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ListMoviesData, List<MovieModel>>(
      selector: (_, data) => data.listMovie,
      builder: (context, listMovie, _) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = listMovie[index];
            return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(elevation: 18.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: getImageView(data.backdropPath),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(8.0),
              ),
              Text(
                data.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: listMovie.length,
        );
      },
    );
  }

  Widget getImageView(String imageStr) {
    final image = Image.network(ImageConstants.instance.url_base + imageStr,
    fit: BoxFit.cover);
    return image;
  }
}