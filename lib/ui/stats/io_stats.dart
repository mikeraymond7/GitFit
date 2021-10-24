import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fit/ui/stats/US.dart';

class IoStats extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const IoStats({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Enter Stats Below!"),
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
            ])));
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

class SetConfigs extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  SetConfigs({Key? key});
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
                          return 'Please Enter Your Weight:';
                        }
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
