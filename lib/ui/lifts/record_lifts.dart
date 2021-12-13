// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/server-db/server_conn.dart';

// ignore: use_key_in_widget_constructors
class RecLiftsPage extends StatefulWidget {
  @override
  State<RecLiftsPage> createState() => _RecLiftsPageState();
}

class _RecLiftsPageState extends State<RecLiftsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Fat %:'),
      ),
      body: Center(
        heightFactor: 20.0,
        child: IoLifts(),
      ),
    );
  }
}

class IoLifts extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  IoLifts({Key? key});
  //final String option;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // the following will be refactored based on DB and stats.dart uses:
    // ignore: unused_local_variable
    var json = {};
    var key = 'Bench';
    var val;
    var listValues = [
      'Bench',
      'Squat',
      'Deadlift',
      'LegPress',
      'HangClean',
      'PushPress',
    ];

    var listFields = [
      'Bench',
      'Squat',
      'Deadlift',
      'Leg Press',
      'Hang Clean',
      'Push Press',
    ];

    var listDropDown = <DropdownMenuItem<Object>>[];
    for (var i = 0; i < listFields.length; i++) {
      listDropDown.add(DropdownMenuItem(
        child: Text(listFields[i]),
        value: listValues[i],
      ));
    }

    // List view to avoid pixel overflow when typing
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            // Expanded to ensure formats don't overlap or run off page
            Expanded(
              child: Column(
                children: [
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
                      isExpanded: true,
                      items: listDropDown,
                      hint: const Text('Click To Select'),
                      onChanged: (value) {
                        for (var field in listValues) {
                          if (field == value) {
                            key = value.toString();
                          }
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
                              val = int.parse(value);
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
          padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 150.0),
          // take input
          child: ElevatedButton(
            onPressed: () /*async*/ {
              if (_formKey.currentState!.validate()) {
                ToServer().updateLifts({key: val});
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
