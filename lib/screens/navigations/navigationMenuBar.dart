import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_neversitup/models/screenIndex.dart';


class NavigationMenuBar {
  
  BottomNavigationBarItem buildBottomNavigationBarItem(IconData icon1,
      IconData icon2, int val, ScreenIndex screenIndex, String title) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: screenIndex.index == val
          ? Container(
              margin: const EdgeInsets.only(left: 2, right: 2),
              child: FaIcon(
                icon1,
                size: 20,
                color: Colors.lightBlue,
              ),
            )
          : Container(
              margin: const EdgeInsets.only(left: 4, right: 4),
              child: FaIcon(
                icon2,
                size: 20,
              )),
      label: title,
    
    );
  }
}
