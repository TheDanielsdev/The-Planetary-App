import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:the_planetary/helpers/color_helper.dart';
import 'package:the_planetary/screens/home_page.dart';
import 'package:the_planetary/screens/likes.dart';
import 'package:the_planetary/screens/search.dart';
import 'package:the_planetary/screens/settings.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<Widget> pages = [
    HomePage(),
    Likes(),
    Search(),
    Settings(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        color: AppColor.Tertiary_Color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              gap: 8,
              backgroundColor: AppColor.Tertiary_Color,
              color: Colors.white,
              activeColor: Colors.white,
              padding: const EdgeInsets.all(5),
              tabBackgroundColor: Colors.black,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search_rounded,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'settings',
                )
              ]),
        ),
      ),
    );
  }
}
