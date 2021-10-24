import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/*
Incomplete Home Page, UI Needs Work
Hosts Multiple Dashboard Widgets that move to other pages
*/
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // returns constant Dashboard navigator buttons
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title: const Center(
        child: Text(
          "GitFit",
          style: TextStyle(fontSize: 30),
        ),
      )),
      // List of Dashboard objects below Home UI
      body: ListView(children: [
        Flexible(
            child: DashBoard(
          path: '/my_goals',
          name: 'Current Goals',
          description: 'Check out your\nPersonal Goals!',
        )),
        Flexible(
            child: DashBoard(
          path: '/ioStats',
          name: 'Statistics',
          description: 'Check out your stats!',
        )),
      ]),
      bottomNavigationBar: BottomNavigationBar(
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
          ]),
    );
  }
}

// ignore: must_be_immutable
class DashBoard extends StatelessWidget {
  DashBoard(
      {Key? key,
      required this.name,
      required this.description,
      required this.path})
      : super(key: key);

  final String name;
  final String path;
  String description;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, path);
        },
        child: Container(
            color: Colors.blueGrey[200],
            padding: const EdgeInsets.all(10),
            height: 80,
            //child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Center(
                        child: Text(name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )))),
                Expanded(
                  child: Center(
                    child: Text(description,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        )),
                  ),
                )
              ],
            )));
  }
}
