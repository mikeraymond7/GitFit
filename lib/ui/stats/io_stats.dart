import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/ui/stats/US/US.dart';
import 'package:git_fit/app/controller.dart';

class IoStats extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const IoStats({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Get Started!"),
      ),
      body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
            Expanded(
              child: Center(
                child: Text("Choose a metric:"),
              ),
            ),
            Expanded(
                child: StatsConfigs(
                    //option: '1',
                    )),
          ])),
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

class StatsConfigs extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const StatsConfigs({Key? key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
          child: Text('US'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Metric'),
          value: 2,
        ),
      ],
      hint: const Text('Click Here To Choose'),
      onChanged: (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const UsConfig()));
      },
    );
  }
}
