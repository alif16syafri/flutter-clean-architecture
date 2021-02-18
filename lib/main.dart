import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/service_locator/get_it.dart' as GetIt;
import 'package:flutter_clean_architecture/presentation/core/constants/palette.dart';
import 'package:flutter_clean_architecture/presentation/core/router/router_constant.dart';
import 'package:flutter_clean_architecture/presentation/core/router/router.dart' as CustomRoutes;
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // dependency injection
  await GetIt.registerPresentationLayer();
  await GetIt.registerDataLayer();

  _setStatusBarColor();

  runApp(MyApp());
}

void _setStatusBarColor() {
  FlutterStatusbarcolor.setStatusBarColor(Palette.white);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Clean Architecture',
      initialRoute: RouterConstant.HOME,
      onGenerateRoute: CustomRoutes.Router().generateAppRoutes,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Palette.white,
        primaryColor: Palette.gray100,
        scaffoldBackgroundColor: Palette.white,
        textTheme: GoogleFonts.openSansTextTheme(textTheme).copyWith(
          headline1: TextStyle(
            fontSize: 30.0,
            color: Palette.black100,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            color: Palette.black100,
            fontWeight: FontWeight.w700,
          ),
          headline3: TextStyle(
            fontSize: 22.0,
            color: Palette.black100,
            fontWeight: FontWeight.w600,
          ),
          headline4: TextStyle(
            fontSize: 20.0,
            color: Palette.black100,
            fontWeight: FontWeight.w600,
          ),
          headline5: TextStyle(
            fontSize: 18.0,
            color: Palette.black100,
            fontWeight: FontWeight.w600,
          ),
          headline6: TextStyle(
            fontSize: 16.0,
            // color: Palette.black100,
            fontWeight: FontWeight.w600,
          ),
          subtitle1: TextStyle(
            fontSize: 20.0,
            color: Palette.black100,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            color: Palette.black100,
            height: 1.1,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            height: 1.1,
            fontWeight: FontWeight.w500,
            color: Palette.black100,
          ),
          subtitle2: TextStyle(
            fontSize: 13.0,
            height: 1.25,
            fontWeight: FontWeight.w500,
            color: Palette.black100,
          ),
          caption: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Palette.black100,
          ),
          overline: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: Palette.black100,
            letterSpacing: 0.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
