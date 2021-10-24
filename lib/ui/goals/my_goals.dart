import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGoals extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyGoals({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check out your goals!!"),
      ),
    );
  }
}
