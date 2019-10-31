import 'package:flutter/widgets.dart';

///
/// Safe colors. If color has intencity,
/// its current intencity depends on current theme
///
class YXColorScheme {
  YXColorScheme({
    this.pageBackground,
    this.textNormal,
    this.textHint,
    this.divider,
    this.red,
    this.amber,
    this.yellow,
    this.green,
    this.blue,
    this.purple,
  });

  final Color pageBackground;
  final Color textNormal;
  final Color textHint;
  final Color divider;

  final Color red;
  final Color amber;
  final Color yellow;
  final Color green;
  final Color blue;
  final Color purple;
}
