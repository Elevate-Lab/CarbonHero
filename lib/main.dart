import 'package:carbon_emission/screens/MainScreen.dart';
import 'package:carbon_emission/screens/Waste.dart';
import 'package:carbon_emission/screens/login.dart';
import 'package:carbon_emission/screens/naturalGas.dart';

import 'package:carbon_emission/screens/splashScreen2.dart';

import 'package:carbon_emission/screens/splashScreen1.dart';
import 'package:carbon_emission/screens/televisionScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/homeScreen.dart';

import 'package:flutter/services.dart';
import 'package:carbon_emission/screens/chooseNewActivity.dart';

import 'screens/MainScreen.dart';
import 'screens/MainScreen.dart';
import 'screens/chooseNewActivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // bool loggedIN = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carbon Hero',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: const Color(0xff281627),
        accentColor: const Color(0xffFEBB46),
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SplashScreen1.routeName: (ctx) => SplashScreen1(),
        SplashScreen2.routeName: (ctx) => SplashScreen2(),
        LogIn.routeName: (ctx) => LogIn(),
        chooseNewActivity.routeName: (ctx) => chooseNewActivity(),
        MainScreen.routeName: (ctx) => MainScreen(),
      Waste.routeName: (ctx) => Waste(),
      },
    );
  }
}
