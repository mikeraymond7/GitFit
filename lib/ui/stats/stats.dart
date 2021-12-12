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
      appBar: AppBar(
        title: const Text("My Stats:"),
      ),
      body: Center(
        child: ListView(
          children: [
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

  FutureBuilder<Stats> buildFutureBuilder() {
    return FutureBuilder<Stats>(
        future: _futureStats,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.uname);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        });
  }
}
