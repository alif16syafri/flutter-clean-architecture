import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/service_locator/get_it.dart';
import 'package:flutter_clean_architecture/presentation/core/router/router_constant.dart';
import 'package:flutter_clean_architecture/presentation/features/article/articles/bloc/articles_bloc.dart';
import 'package:flutter_clean_architecture/presentation/features/article/articles/screen/articles_screen.dart';

class Router {
  Widget getRoutedWidget(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstant.ARTICLES:
      case RouterConstant.HOME:
      default:
        return BlocProvider(
          create: (_) => getIt<ArticlesBloc>(),
          child: ArticlesScreen(),
        );
        break;
    }
  }

  Route generateAppRoutes(RouteSettings settings) {
    Widget routedWidget = getRoutedWidget(settings);

    return MaterialPageRoute(
      builder: (_) => ScrollConfiguration(
        behavior: MyBehavior(),
        child: routedWidget,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  /// Remove material scroll glow
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
