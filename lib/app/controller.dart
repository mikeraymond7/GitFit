// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/ui/goals/goals.dart';
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
    GoalsPage(),
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
            icon: Icon(
              Icons.lightbulb_outline,
              color: Palette.mainOrange,
            ),
            title: Text(
              'Goals',
              style: TextStyle(color: Palette.mainOrange),
            ),
          ),
          const BottomNavigationBarItem(
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
