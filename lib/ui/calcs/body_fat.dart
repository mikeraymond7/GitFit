// ignore_for_file: file_names, unused_import

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/database/database.dart';
import 'package:git_fit/database/stats.dart';
import 'package:git_fit/ui/calcs/functions.dart';

// ignore: use_key_in_widget_constructors
class BfpPage extends StatefulWidget {
  @override
  State<BfpPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BfpPage> {
  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Fat %:'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IoBfp(),
            )
          ],
        ),
      ),
    );
  }
}

class IoBfp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  IoBfp({Key? key});
  //final String option;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // the following will be refactored based on DB and stats.dart uses:
    // ignore: unused_local_variable
    int id = 1;
    int weight = 0;
    int height = 0;
    int age = 0;
    double bfp = 0;
    int lean = 0;
    int fat = 0;
    int sex = 1;

    return ListView(children: [
      Row(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                //Expanded(
                //child:
                const Center(
                  child: Text("Enter Your \nInformation:",
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        child: Text('Male'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Female'),
                        value: 2,
                      ),
                    ],
                    hint: const Text('Sex'),
                    onChanged: (value) {
                      if (value == 1) {
                        sex = 1;
                      } else if (value == 2) {
                        sex = 2;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Weight (lbs)',
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
                          hintText: 'Height (in)',
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
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Age',
                        ),
                        validator: (String? value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.compareTo('0') < 1) {
                            return 'Please Enter a Valid Age:';
                          } else {
                            age = int.parse(value);
                          }
                          return null;
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 150.0),
        child: ElevatedButton(
          onPressed: () /*async*/ {
            if (_formKey.currentState!.validate()) {
              bfp = Functions.CalcBFP(weight, height, age, sex);
              fat = ((bfp * weight) / 100).round();
              lean = weight - fat;
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                    title: const Text('Body Fat %:'),
                    content: Text("Body Fat: " +
                        bfp.round().toString() +
                        "%\n\tFat: " +
                        fat.toString() +
                        " lbs\n\tLean: " +
                        lean.toString() +
                        " lbs"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(context, 'Ok, I\'ve seen enough'),
                        child: const Text('Ok, I\'ve seen enough'),
                      )
                    ]),
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
          child: const Text('Submit'),
        ),
      )
    ]);
  }
}
