import 'package:flutter/material.dart';

import 'components/button.dart';
import 'components/typo.dart';
import 'components/value.dart';

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                children: [
                  Button(title: 'A button'),
                ],
            ),
        ),
    );
  }
}

