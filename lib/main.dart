import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/list.dart';
import 'package:flutter_application_1/screens/news_detail.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/screens/try.dart';




void main() {
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
                '/':(context) =>  const splash_screen (),
                '/Home':(context) => const Home(),
                '/detail':(context) => const news_detail(),
                '/list':(context) => const list(),
              },
          );
  }
}
