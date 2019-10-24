import 'package:flutter/material.dart';
import 'exp_data.dart';

class ExperimentProvider extends InheritedWidget {
  ExperimentProvider({
    Key key,
    @required this.expNames,
    @required this.data,
    Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

  final List<String> expNames;
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
