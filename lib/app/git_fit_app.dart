import 'package:flutter/material.dart';
import '../ui/home/home_page.dart';

class GitFitApp extends StatelessWidget {
  const GitFitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Fit',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Raleway',
      ),
      home: const HomePage(),
    );
  }
}
