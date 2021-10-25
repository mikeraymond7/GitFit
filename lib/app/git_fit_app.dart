import 'package:flutter/material.dart';
import 'package:git_fit/ui/home/home_page.dart';
import 'package:git_fit/ui/calcs/calcs.dart';
import 'package:git_fit/ui/goals/goals.dart';
import 'package:git_fit/ui/stats/stats.dart';
import 'package:git_fit/app/controller.dart';
import 'package:flutter/widgets.dart';
import 'package:git_fit/config/colors.dart';

//import 'package:git_fit/database/database.dart';

// ignore: use_key_in_widget_constructors
class GitPage extends StatefulWidget {
  @override
  State<GitPage> createState() => _GitPageState();
}

class _GitPageState extends State<GitPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Fit',
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/calcs': (context) => CalcsPage(),
        '/goals': (context) => GoalsPage(),
        '/stats': (context) => StatsPage(),
      },
      theme: ThemeData(
        //backgroundColor: const Color(0xffb0bec5),
        primarySwatch: Palette.mainOrange,
      ),
      home: NavPage(),
    );
  }
}
