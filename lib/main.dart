import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/observer/bloc_observer.dart';
import 'package:shop_app_clean/core/routes/route_generator.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/core/styles/theme_data.dart';

void main() {
  ServicesLocator().setupLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: sl<NavigationService>().navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: Themes.mainTheme,
    );
  }
}
