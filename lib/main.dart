import 'package:flutter/material.dart' hide Theme, ThemeData;

import './exp_provider.dart';
import './showcase.dart';
import 'components/theme.dart';
import 'exp/button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exp = ExperimentData(
      button: withExp,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: ExperimentProvider(
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
