// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsConfig extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const UsConfig({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> _nums = ['0', '0', '0'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('US Version:'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SetUsConfigs(),
            )
          ],
        ),
      ),
    );
  }
}

class SetUsConfigs extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  SetUsConfigs({Key? key});
  //final String option;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /*List<String> _options;
    if (option == '1') {
      _options = ['lbs', 'ft', 'in'];
    } else if (option == '2') {
      _options = ['kg', 'cm'];
    }*/
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Expanded(child: Center(child: Text("Calculate BMI:"))),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Weight (lbs)',
                      ),
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.compareTo('0') < 1) {
                          print(value);
                          return 'Please Enter a Valid Weight:';
                        } else {}
                        return null;
                      },
                    ),
                    /* Row(
                      children: [
                        TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Height (ft)',
                            ),
                            validator: (String? value) {
                              //if (value == null)
                            })
                      ],
                    ),*/
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Hi");
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
