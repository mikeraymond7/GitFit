import 'package:flutter/material.dart';
import '../ui/home/home_page.dart';
import '../ui/stats/io_stats.dart';
import '../ui/goals/my_goals.dart';

class GitFitApp extends StatelessWidget {
  const GitFitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Fit',
      initialRoute: '/',
      routes: {
        //'/': (context) => const HomePage(),
        '/ioStats': (context) => const IoStats(),
        '/my_goals': (context) => const MyGoals(),
      },
      theme: ThemeData(
        //backgroundColor: const Color(0xffb0bec5),
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}
