
import 'package:flutter_template/screens/home.dart';


import 'package:flutter_template/screens/login.dart';
import 'package:flutter_template/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/dims.dart';
import 'constants/strings.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));


    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        title: Strings.AppName,
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/home': (context) => Home(),
          '/login': (context) => Login(),
        },
        theme: ThemeData(

          appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF7C600)),
          fontFamily: 'IranSans',
          navigationBarTheme: NavigationBarThemeData(
              indicatorColor: Colors.black,
              iconTheme: MaterialStateProperty.all(IconThemeData(
                color: Colors.black,
              ))),
          scaffoldBackgroundColor: Color(0xFF2C2C2C),
          primaryColor: Color(0xFFF7C600),
          primaryColorLight: Color(0xFFFDF3D2),
          primaryColorDark: Color(0xFFE5B22F),
          splashColor: Color(0xB8FFC600),
          highlightColor: Color(0x49FFC600),
          primarySwatch: white,
          sliderTheme: SliderThemeData(
              inactiveTrackColor: Color(0xFFFDF3D2),
              activeTrackColor: Color(0xFFF7C600),
              activeTickMarkColor: Color(0xFFF7C600),
              inactiveTickMarkColor: Color(0xFFFDF3D2),
              thumbColor: Color(0xFFE5B22F),
              overlayShape: SliderComponentShape.noThumb),
          inputDecorationTheme: InputDecorationTheme(

            contentPadding: EdgeInsets.only(
                top: 3,
                bottom: 3,
                right: Dims.bigPadding,
                left: Dims.bigPadding),
            labelStyle: TextStyle(fontFamily: 'IranSans',color: Colors.white),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Color(0xFFFDF3D2), width: 2.0),
              borderRadius: BorderRadius.circular(Dims.boxBorderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFFFDF3D2), width: 2.0),
              borderRadius: BorderRadius.circular(Dims.boxBorderRadius),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dims.boxBorderRadius),
                )),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFE5B22F)),
                  foregroundColor: MaterialStateProperty.all(Colors.black))),
          textTheme: TextTheme(
            button: TextStyle(
                fontSize: 16,
                color: Color(0xFFFA3CA1),
                fontWeight: FontWeight.bold),
            headline6: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            headline5: TextStyle(
                color: Color(0xFF474646), fontWeight: FontWeight.bold),
            headline4: TextStyle(
                color: Color(0xFF474646), fontWeight: FontWeight.bold),
            subtitle2: TextStyle(fontSize: 16, color: Colors.black),
            bodyText1: TextStyle(fontSize: 16, color: Colors.black),
            bodyText2: TextStyle(fontSize: 16, color: Color(0xFF474646)),
          ),
        ),
      ),
    );
  }
}

enum RouteName {
  workbench_home,
  workbench_dates,
  login,
}

class Routes {
  static String get(RouteName routeName) {
    switch (routeName) {
      case RouteName.workbench_home:
        return "/workbench/home";
      case RouteName.workbench_dates:
        return "/workbench/dates";

      case RouteName.login:
        return "/login";
    }
  }
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);