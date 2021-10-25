import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/ui/goals/goals.dart';
import 'package:git_fit/ui/home/home_page.dart';
import 'package:git_fit/ui/calcs/calcs.dart';

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
      bottomNavigationBar:
          BottomNavigationBar(onTap: _changeIdx, currentIndex: _idx,
              // ignore: prefer_const_literals_to_create_immutables
              items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              label: 'Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart_outlined),
              label: 'Calculations',
            )
          ]),
    );
  }
}
