import 'package:carbon_emission/models/user.dart';
import 'package:carbon_emission/screens/MainScreen.dart';
import 'package:carbon_emission/screens/Profile.dart';
import 'package:carbon_emission/screens/Waste.dart';
import 'package:carbon_emission/screens/electricityScreen.dart';
import 'package:carbon_emission/screens/homeAppliances.dart';
import 'package:carbon_emission/screens/login.dart';
import 'package:carbon_emission/screens/LPG.dart';

import 'package:carbon_emission/screens/splashScreen2.dart';

import 'package:carbon_emission/screens/splashScreen1.dart';
import 'package:carbon_emission/screens/televisionScreen.dart';
import 'package:carbon_emission/screens/transportScreen.dart';
import 'package:carbon_emission/widget/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './screens/homeScreen.dart';

import 'package:flutter/services.dart';
import 'package:carbon_emission/screens/chooseNewActivity.dart';

import 'screens/MainScreen.dart';
import 'screens/chooseNewActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

String loginStatus;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 SharedPreferences prefs = await SharedPreferences.getInstance();
 loginStatus =  prefs.getString('logInName');
 //print(loginStatus);
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // bool loggedIN = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    print("here -> $loginStatus");
    return ChangeNotifierProvider(
      create: (context) => User(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carbon Hero',
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: const Color(0xff281627),
          accentColor: const Color(0xffFEBB46),
        ),
        initialRoute: loginStatus=="logOut"? SplashScreen1.routeName:LogIn.routeName,
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          SplashScreen1.routeName: (ctx) => SplashScreen1(),
          SplashScreen2.routeName: (ctx) => SplashScreen2(),
          LogIn.routeName: (ctx) => LogIn(),
          chooseNewActivity.routeName: (ctx) => chooseNewActivity(),
          MainScreen.routeName: (ctx) => MainScreen(),
          Waste.routeName: (ctx) => Waste(),
          LPG.routeName: (ctx) => LPG(),
          Electricity.routeName: (ctx) => Electricity(),
          Transport.routeName: (ctx) => Transport(),
          Television.routeName: (ctx) => Television(),
          HomeAppliances.routeName: (ctx) => HomeAppliances(),
          Profile.routeName: (ctx) => Profile(),
        },
      ),
    );
  }
}
