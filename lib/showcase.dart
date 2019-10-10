import 'package:di_test/exp_provider.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';
import 'components/typo.dart';
import 'components/value.dart';

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exp = ExperimentProvider.of(context);
    print(exp);

    return Scaffold(
        body: Center(
            child: Column(
                children: [
                  Button(title: 'A button'),
                  exp.button(title: 'Button from exp'),
                ],
            ),
        ),
    );
  }
}

