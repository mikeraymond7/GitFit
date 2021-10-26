// ignore_for_file: file_names, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/database/database.dart';
import 'package:git_fit/database/stats.dart';
import 'package:git_fit/ui/calcs/functions.dart';

// ignore: use_key_in_widget_constructors
class BmiPage extends StatefulWidget {
  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI:'),
      ),
      body: IoBMI(),
    );
  }
}

class IoBMI extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  IoBMI({Key? key});
  //final String option;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int id = 1;
    int weight = 0;
    int height = 0;
    int bmi = 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Expanded(
                child: Center(
                    child: Text("Calculate BMI:",
                        style: TextStyle(fontSize: 20)))),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter Your Weight (lbs)',
                          ),
                          validator: (String? value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.compareTo('0') < 1) {
                              return 'Please Enter a Valid Weight:';
                            } else {
                              weight = int.parse(value);
                            }
                            return null;
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Height (in)',
                        ),
                        validator: (String? value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.compareTo('0') < 1) {
                            return 'Please Enter a Valid Height:';
                          } else {
                            height = int.parse(value);
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () /*async*/ {
              // check if state is valid
              if (_formKey.currentState!.validate()) {
                bmi = Functions.CalcBMI(weight, height, 1).round();
                // display score on valid submission
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('BMI Score:'),
                    content: Text("Your BMI is: " + bmi.toString()),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () =>
                            // exit from display
                            Navigator.pop(context, 'Ok, I\'ve seen enough'),
                        child: const Text('Ok, I\'ve seen enough'),
                      )
                    ],
                  ),
                );

                //if (isValid(weight, height)){
                // await StatsDB.instance.create(Stats(
                //   id: 1,
                //   height: height,
                //   weight: weight,
                //   bmi: (CalcBMI(weight, height, id).floor()),
                // ));
                //}
              }
            },
            // button name
            child: const Text('Submit'),
          ),
        )
      ],
    );
  }
}
