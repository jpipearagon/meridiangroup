import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../factory/view_model_factory.dart';
import '../model_base/state_data.dart';
import '../view_model_base/view_model.dart';

abstract class ScreenView extends StatefulWidget {
  const ScreenView({Key? key}) : super(key: key);

  @override
  ScreenViewState createState();
}

abstract class ScreenViewState<T extends ScreenView, T2 extends ViewModel<T3>,
    T3 extends StateData> extends State<T> {
  ScreenViewState();

  late final T2 viewModel;

  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ValueListenableProvider<T3>.value(value: viewModel),
      ],
      builder: (context, _) => buildScreen(context),
    );
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    viewModel = context.read<ViewModelFactory>().create<T2>();
  }

  @override
  @mustCallSuper
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
