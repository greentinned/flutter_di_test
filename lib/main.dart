import 'package:di_test/exp_provider.dart';
import 'package:flutter/material.dart';
import './showcase.dart';
import 'components/button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exp = ExperimentData(button: Button);

    return MaterialApp(
      title: 'Flutter Demo',
      home: ExperimentProvider(
          data: exp,
          child: ShowcasePage(),
      ),
    );
  }
}