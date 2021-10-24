import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigate extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Navigate({Key? key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined),
            label: 'Stats',
            backgroundColor: Colors.red,
          )
        ]);
  }
}
