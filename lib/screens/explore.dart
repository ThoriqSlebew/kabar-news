import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/explore_bussines.dart';
import 'package:flutter_application_1/screens/explore_health.dart';
import 'package:flutter_application_1/screens/explore_techno.dart';
import 'package:flutter_application_1/screens/navigation.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:flutter_application_1/models/article_model.dart';
import 'package:google_fonts/google_fonts.dart';

final category = [
  const explore_techno(),
  const explore_health(),
  const explore_techno()
];

int activeCategory = 0;

var a = 10;

List<Tab> myTab = [
  const Tab(
    text: 'Business',
  ),
  const Tab(
    text: 'Health',
  ),
  const Tab(
    text: 'Technology',
  ),
];

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<explore> {
  ApiBussines client3 = ApiBussines();
  String selectedCategory = '';

  void filterCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Explore',
                style: GoogleFonts.manrope(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                )),
            bottom: TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: myTab,
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: TabBarView(
              children: [
                explore_bussines(),
                explore_health(),
                explore_techno(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
