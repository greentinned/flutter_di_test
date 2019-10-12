import 'package:di_test/exp_provider.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';
import 'components/value.dart';

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exp = ExperimentProvider.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Value(text: 'A Value'),
            Button(ButtonBuilder(title: 'A Button')),
            exp.button(ButtonBuilder(title: 'Button from exp')),
          ],
        ),
      ),
    );
  }
}
