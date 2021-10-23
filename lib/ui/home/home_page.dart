import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text(
            "GitFit",
            style: TextStyle(fontSize: 30, fontFamily: 'RobotoMono'),
          ),
        )),
        body: Column(children: [
          GestureDetector(
              onTap: () {
                // go to tasks board
              },
              child: Flexible(
                  child: DashBoard(
                name: 'Current Tasks',
                description: '',
              ))),
          GestureDetector(
            onTap: () {
              // go to stats board
            },
            child: Flexible(
                child: DashBoard(
              name: 'Statistics',
              description: 'Check out your stats!',
            )),
          )
        ]));
  }
}

// ignore: must_be_immutable
class DashBoard extends StatelessWidget {
  DashBoard({Key? key, required this.name, required this.description})
      : super(key: key);

  final String name;
  String description;
  @override
  Widget build(BuildContext context) {
    if (description == "") {
      description = "Make More Plans Today!";
    }
    return Container(
        padding: const EdgeInsets.all(10),
        height: 110,
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(
                    description,
                  )))
                ],
              ),
            )
          ],
        )));
  }
}
