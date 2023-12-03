import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/screens/about.dart';
import 'package:flutter_application_1/screens/explore.dart';
import 'package:flutter_application_1/screens/explore_health.dart';
import 'package:flutter_application_1/screens/explore_health.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/latest.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/news_detail.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/profile_detail.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/screens/trending.dart'; 


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) { 
      return MaterialApp(
            title: 'Flutter News App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor:Colors.black12),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
              //home:  const Home(),
              initialRoute: '/',
              routes: {
                '/':(context) =>  const splash_screen(),
                '/login':(context) =>  const login (),
                '/Home':(context) => const Home(),
                '/detail':(context) => const news_detail(),
                '/explore':(context) => const explore(),
                '/trending':(context) => const trending(),
                '/latest':(context) => const latest(),
                '/profile':(context) => const profile(),
                '/profile_detail':(context) => const profile_detail(),
                '/editprofile':(context) => const profile_detail(),
                '/explore_health':(context) => const explore_health(),
                '/about_us':(context) => const about(),

              },
          );
  }
}
