import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../factory/view_model_factory.dart';
import '../inject/dependency_injection.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: getIt.get<ViewModelFactory>()),
      ],
      child: child,
    );
  }
}
