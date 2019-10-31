import 'package:flutter/material.dart' hide Theme, ThemeData;

import './showcase.dart';
import 'components/theme.dart';
import 'components/theme_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isNightMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: YXTheme(
        data: isNightMode ? YXThemeData.dark : YXThemeData.light,
        child: ShowcasePage(),
      ),
    );
  }
}
