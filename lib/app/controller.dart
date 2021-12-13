// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/ui/lifts/record_lifts.dart';
import 'package:git_fit/ui/home/home_page.dart';
import 'package:git_fit/ui/calcs/calcs.dart';
import 'package:git_fit/ui/stats/stats.dart';
import 'package:git_fit/config/colors.dart';

// ignore: use_key_in_widget_constructors
class NavPage extends StatefulWidget {
  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _idx = 0;

  final List<Widget> _indexList = [
    HomePage(),
    RecLiftsPage(),
    CalcsPage(),
    StatsPage(),
  ];

  void _changeIdx(int idx) {
    setState(() {
      _idx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _indexList[_idx],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        fixedColor: Palette.mainOrange,
        onTap: _changeIdx, currentIndex: _idx,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Palette.mainOrange),
            icon: Icon(
              Icons.home_outlined,
              color: Palette.mainOrange,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Palette.mainOrange),
            ),
          ),
          const BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.local_fire_department, color: Palette.mainOrange),
            icon: Icon(
              Icons.whatshot,
              color: Palette.mainOrange,
            ),
            title: Text(
              'Set Records',
              style: TextStyle(color: Palette.mainOrange),
            ),
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.calculate, color: Palette.mainOrange),
            icon: Icon(
              Icons.calculate_outlined,
              color: Palette.mainOrange,
            ),
            title: Text(
              'Calculations',
              style: TextStyle(color: Palette.mainOrange),
            ),
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.insert_chart, color: Palette.mainOrange),
            icon: Icon(
              Icons.insert_chart_outlined,
              color: Palette.mainOrange,
            ),
            title: Text(
              'My Stats',
              style: TextStyle(color: Palette.mainOrange),
            ),
          ),
        ],
      ),
    );
  }
}
