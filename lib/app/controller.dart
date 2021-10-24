import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoTo extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GoTo({Key? key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(path),
        ),
        body: Center(
            child: Container(
          color: Colors.blueGrey[200],
          padding: const EdgeInsets.all(10),
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ioStats');
            },
            child: const Text('Back'),
          ),
        )));
  }
}
