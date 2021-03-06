// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/server-db/db_objects.dart';
import 'package:git_fit/server-db/server_conn.dart';
import 'package:git_fit/config/colors.dart';

// ignore: use_key_in_widget_constructors
class StatsPage extends StatefulWidget {
  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  // ignore: use_key_in_widget_constructors
  final Future<Stats>? _futureStats =
      ToServer().getStats('mraymond2@pride.hofstra.edu');
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xd1000000),
      appBar: AppBar(
        title: const Text("My Stats:"),
      ),
      body: Center(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 90, 50, 20),
              child: Text(
                "Check Out Your Up-To-Date Stats:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    //color: Color(0xffffffff),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child:
                  (_futureStats == null) ? buildColumn() : buildFutureBuilder(),
            ),
          ],
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Your Name'),
        ),
      ],
    );
  }

  SizedBox buildStatsView(Stats stats) {
    var mapStats = [
      'Height: ',
      'Weight: ',
      'Body Mass Index: ',
      'Body Fat Percentage: ',
      'Estimated Lean Weight: ',
      'Estimated Fat Weight: ',
    ];

    var listStats = [
      (stats.height / 12).floor().toString() +
          '\' ' +
          (stats.height % 12).toString() +
          '"',
      stats.weight.toString() + ' lbs',
      stats.bmi.toString(),
      stats.bfp.toString() + '%',
      stats.lean.toString() + ' lbs',
      stats.fat.toString() + ' lbs',
    ];

    var widgets =
        //find why automation does not work

        <Widget>[];
    for (var i = 0; i < listStats.length; i++) {
      //String text = mapStats[i] + listStats[i];
      widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(46, 7, 20, 10),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mapStats[i],
                style: const TextStyle(
                    //color: Color(0xffffffff),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                listStats[i],
                style: const TextStyle(
                  //color: Color(0xffffffff),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      );
    }
    widgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40, 40, 10),
        child: DashBoard(name: "Click To See Your Lifts", path: '/lifts'),
      ),
    );

    return SizedBox(
      height: 534.0,
      child: ListView(
        children: widgets,
      ),
    );
  }

  FutureBuilder<Stats> buildFutureBuilder() {
    return FutureBuilder<Stats>(
      future: _futureStats,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildStatsView(snapshot.data!);
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Center(
                heightFactor: 5,
                child: Text(
                  'Hmm... I don\'t think you finished updating your stats\nThat\'s ok, click below',
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                heightFactor: 2,
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: DashBoard(
                    name: 'Calculate your stats!',
                    path: '/calcs',
                  ),
                ),
              ),
            ],
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class DashBoard extends StatelessWidget {
  DashBoard({Key? key, required this.name, required this.path})
      : super(key: key);

  final String name;
  final String path;
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Palette.mainOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
