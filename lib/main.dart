import 'package:carbon_emission/screens/MainScreen.dart';
import 'package:carbon_emission/screens/login.dart';

import 'package:carbon_emission/screens/splashScreen_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/homeScreen.dart';

import './screens/splashScreen_1.dart';

import 'package:flutter/services.dart';
import 'package:carbon_emission/screens/newuser.dart';

import 'screens/MainScreen.dart';
import 'screens/MainScreen.dart';

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
      // home: loggedIN == true ? HomeScreen() : MainScreen(),
      initialRoute: SplashScreen_1.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SplashScreen_1.routeName: (ctx) => SplashScreen_1(),
        SplashScreen_2.routeName: (ctx) => SplashScreen_2(),
        LogIn.routeName: (ctx) => LogIn(),
        NewUser.routeName: (ctx) => NewUser(),
        MainScreen.routeName: (ctx) => MainScreen()
      },
    );
  }
}
