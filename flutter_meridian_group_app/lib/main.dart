import 'package:flutter/material.dart';
import 'core/app/app.dart';
import 'core/inject/dependency_injection.dart';
import 'core/navigation/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeGetIt();

  final router = createRouter();

  return runApp(
    App(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    ),
  );
}