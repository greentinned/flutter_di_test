import 'package:flutter/material.dart' hide Theme, ThemeData;

import './exp_provider.dart';
import './showcase.dart';
import 'components/theme.dart';
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
        child: Theme(
          data: ThemeData(
            colors: ColorPalette(
              text: Colors.black,
              secondaryText: Colors.grey,
            ),
          ),
          child: ShowcasePage(),
        ),
      ),
    );
  }
}
