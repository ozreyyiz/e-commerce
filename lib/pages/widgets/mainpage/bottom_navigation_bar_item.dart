import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

BottomNavyBarItem bottomNavigationBarItem(
    {required Icon icon, required String title}) {
  return BottomNavyBarItem(
    textAlign: TextAlign.center,
    icon: icon,
    title: Text(title),
    activeColor: Colors.deepOrangeAccent,
    inactiveColor: Colors.grey
  );
}
