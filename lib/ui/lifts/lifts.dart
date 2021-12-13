import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/server-db/db_objects.dart';
import 'package:git_fit/server-db/server_conn.dart';
import 'package:git_fit/config/colors.dart';

// ignore: use_key_in_widget_constructors
class LiftsPage extends StatefulWidget {
  @override
  State<LiftsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<LiftsPage> {
  // ignore: use_key_in_widget_constructors
  final Future<Lifts>? _futureLifts =
      ToServer().getLifts('mraymond2@pride.hofstra.edu');
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xd1000000),
      appBar: AppBar(
        title: const Text("My Lifts:"),
      ),
      body: Center(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 120, 50, 20),
              child: Text(
                "Check Out Your Recorded Lifts:",
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
                  (_futureLifts == null) ? buildColumn() : buildFutureBuilder(),
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

  SizedBox buildStatsView(Lifts lifts) {
    var mapLifts = [
      'Bench: ',
      'Squat: ',
      'Deadlift: ',
      'Leg Press: ',
      'Hang Clean: ',
      'Push Press: ',
      'Pull Ups: ',
    ];

    var listLifts = [
      lifts.bench,
      lifts.squat,
      lifts.deadlift,
      lifts.legPress,
      lifts.hangClean,
      lifts.pushPress,
      lifts.pullUps,
    ];

    var widgets = <Widget>[];
    for (var i = 0; i < listLifts.length; i++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(46, 7, 20, 10),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mapLifts[i],
                style: const TextStyle(
                    //color: Color(0xffffffff),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                listLifts[i].toString(),
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

  FutureBuilder<Lifts> buildFutureBuilder() {
    return FutureBuilder<Lifts>(
      future: _futureLifts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildStatsView(snapshot.data!);
        } else if (snapshot.hasError) {
          return Column(
            children: const [
              Center(
                heightFactor: 6,
                child: Text(
                  'You didn\'t finish recording your lifts yet?\nThat\'s ok, click below',
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                heightFactor: 3,
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: DashBoard(
                    name: 'Record your lifts!',
                    path: '/liftRec',
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
  const DashBoard({Key? key, required this.name, required this.path})
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
