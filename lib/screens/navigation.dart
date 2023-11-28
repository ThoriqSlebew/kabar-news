import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/explore.dart';
import 'package:flutter_application_1/screens/explore_health.dart';
import 'package:flutter_application_1/screens/explore_techno.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final screen = [
  const Home(),
  const explore(),
  const profile(),
  const explore_health(),
  const explore_techno(),
];

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xFFE9EEFA)));

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: screen[_currentIndex],
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.transparent,
      child: GNav(
        selectedIndex: _currentIndex,
              rippleColor: Colors.grey, // tab button ripple color when pressed
              hoverColor: Colors.grey, // tab button hover color
              haptic: true, // haptic feedback
              tabBorderRadius: 15, // tab button border // tab button border
              //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
              curve: Curves.easeOutExpo, // tab animation curves
              duration: Duration(milliseconds: 700), // tab animation duration
              gap:
                  8, // the tab button gap between icon and text  // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor: Colors.blue.shade600,// selected tab background color
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 8), // navigation bar padding
              tabs: [
                GButton(
                  icon: FeatherIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: FeatherIcons.compass,
                  text: 'explore',
                ),
                GButton(
                  icon: FeatherIcons.user,
                  text: 'Profile',
                ),
              ],
              onTabChange: (value) => setState((){
                _currentIndex = value;
              },),
      ),
    );      
  }
}
