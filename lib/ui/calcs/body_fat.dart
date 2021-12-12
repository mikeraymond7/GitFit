// ignore_for_file: file_names, unused_import

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/database/database.dart';
import 'package:git_fit/database/stats.dart';
import 'package:git_fit/ui/calcs/functions.dart';
import 'package:git_fit/database/server_conn.dart';
import 'package:git_fit/database/db_objects.dart';

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
        heightFactor: 20.0,
        child: IoBfp(),
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

    // List view to avoid pixel overflow when typing
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            // Expanded to ensure formats don't overlap or run off page
            Expanded(
              child: Column(
                children: <Widget>[
                  //Expanded(
                  //child:
                  const Center(
                    child: Text(
                      "Enter Your \nInformation:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                // one key can be used for multiple TextFormFields
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Weight (lbs)',
                          ),
                          // use validator to submit data
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 150.0),
          // take input
          child: ElevatedButton(
            onPressed: () /*async*/ {
              if (_formKey.currentState!.validate()) {
                bfp = Functions.CalcBFP(weight, height, age, sex);
                fat = ((bfp * weight) / 100).round();
                lean = weight - fat;
                String mySex = 'm';
                if (sex == 2) {
                  mySex = 'f';
                }

                Bfp stats = Bfp(
                    uname: 'mraymond2@pride.hofstra.edu',
                    bfp: bfp.toInt(),
                    sex: mySex,
                    weight: weight,
                    height: height,
                    age: age,
                    lean: lean,
                    fat: fat);

                // display outcome on submission
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Body Fat %:'),
                    content: Text("Body Fat: " +
                        bfp.round().toString() +
                        "%\n\nFat: " +
                        fat.toString() +
                        " lbs\nLean: " +
                        lean.toString() +
                        " lbs"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => ToServer().updateStats(stats),
                        child: const Text('Update your stats'),
                      ),
                      TextButton(
                        onPressed: () =>
                            // exit from display
                            Navigator.pop(context, 'Exit'),
                        child: const Text('Exit'),
                      ),
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
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
