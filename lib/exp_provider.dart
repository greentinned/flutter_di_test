import 'package:flutter/material.dart';

import 'components/button.dart';

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
    return context.inheritFromWidgetOfExactType(ExperimentData) as ExperimentData;
  }
}

class ExperimentData {
  ExperimentData({
    this.button
  });

  final Type button;
}
