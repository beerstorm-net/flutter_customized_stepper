import 'package:flutter/material.dart';

import 'stepper_custom_impl.dart';
import 'stepper_default_extended.dart';

void main() {
  runApp(MainHome());
}

class MainHome extends StatefulWidget {
  MainHome({Key key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool _isDefaultStepper = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Customized Stepper',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(_isDefaultStepper
                ? 'Default Stepper Ext.d'
                : 'Custom Stepper Impl.d'),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(
                    _isDefaultStepper
                        ? Icons.flip_to_front
                        : Icons.flip_to_back,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _isDefaultStepper = !_isDefaultStepper;
                    });
                  }),
              SizedBox(
                width: 4,
              )
            ],
          ),
          body: _isDefaultStepper ? StepperDefaultExt() : StepperCustomImpl(),
          //body: MainPage(),
        ));
  }
}
