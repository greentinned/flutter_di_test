import 'package:flutter/material.dart' hide Theme, ButtonThemeData;

import 'components/button.dart';

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ButtonBuilder(title: 'A Normal Button').normal,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ButtonBuilder(title: 'An Accent Button').accent,
            ),
          ],
        ),
      ),
    );
  }
}
