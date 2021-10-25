import 'package:flutter/material.dart';
import 'package:git_fit/config/colors.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "GitFit",
            style: TextStyle(
              fontSize: 35,
              color: Palette.mainOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      // List of Dashboard objects below Home UI
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('lib/ui/graphics/lifter.png'),
            // link: https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinclipart.com%2Fmaxpin%2FiTwTTmJ%2F&psig=AOvVaw2s8Lefd9k1vGKjXYqIFwGj&ust=1635206511316000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNC1upCh5PMCFQAAAAAdAAAAABAD
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: DashBoard(
                path: '/goals',
                name: 'Current Goals',
                description: 'Check out your\nPersonal Goals!',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: DashBoard(
                path: '/calcs',
                name: 'Calculations',
                description: 'Calculate your stats!',
              ),
            ),
          ),
        ],
      ),
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
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(50, 60)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: () {
        Navigator.pushNamed(context, path);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Palette.mainOrange,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                description,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Palette.mainOrange,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
