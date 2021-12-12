import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:git_fit/database/db_objects.dart';
import 'package:git_fit/database/server_conn.dart';

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
              padding: EdgeInsets.fromLTRB(50, 120, 50, 20),
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
            )
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
          return const Center(
            heightFactor: 10,
            child: Text(
              'Hmmm... We seem to have had an issue finding your stats...\n\nMaybe try updating all calculations first',
              textAlign: TextAlign.center,
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
