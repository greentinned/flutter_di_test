import 'package:di_test/exp_provider.dart';
import 'package:flutter/material.dart';
import './showcase.dart';
import 'exp/button.dart';
import 'exp/button_lib.dart';
import 'exp_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exp = ExperimentData(
      expName: 'newButton',
      button: buttonLibWithExp,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: ExperimentProvider(
        expNames: ['foo'],
        data: exp,
        child: ShowcasePage(),
      ),
    );
  }
}
