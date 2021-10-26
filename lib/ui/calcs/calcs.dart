import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/ui/calcs/body_mass.dart';
import 'package:git_fit/ui/calcs/body_fat.dart';

// ignore: use_key_in_widget_constructors
class CalcsPage extends StatefulWidget {
  @override
  State<CalcsPage> createState() => _CalcsPageState();
}

class _CalcsPageState extends State<CalcsPage> {
  // ignore: use_key_in_widget_constructors

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
                child: Text(
                  "Choose a \nCalculation:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(child: StatsConfigs()),
          ],
        ),
      ),
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
          child: Text('BMI'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Body Fat %'),
          value: 2,
        ),
      ],
      hint: const Text('Click Here To Choose'),
      onChanged: (value) {
        if (value == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BmiPage()));
        } else if (value == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BfpPage()));
        }
      },
    );
  }
}
