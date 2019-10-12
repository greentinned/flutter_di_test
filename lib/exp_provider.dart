import 'package:flutter/material.dart';

import 'exp/button.dart';

class ExperimentProvider extends InheritedWidget {
  ExperimentProvider({
    Key key,
    @required this.data,
    Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

  final ExperimentData data;

  @override
  bool updateShouldNotify(ExperimentProvider oldWidget) {
    return data != oldWidget.data;
  }

  static ExperimentData of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ExperimentProvider)
            as ExperimentProvider)
        .data;
  }
}

class ExperimentData {
  ExperimentData({
    this.button,
  });

  final ButtonWithExp button;
}
