import 'package:flutter/widgets.dart';

import 'mixin/mixin.dart';
export 'mixin/mixin.dart';

class YXTheme<T extends YXMergeable> extends InheritedWidget {
  YXTheme({
    Key key,
    this.data,
    Widget child,
  }) : super(key: key, child: child);

  final T data;

  @override
  bool updateShouldNotify(YXTheme oldWidget) {
    return data != oldWidget.data;
  }

  static Type _typeOf<T>() => T;

  static T of<T extends YXMergeable>(BuildContext context) {
    final type = _typeOf<YXTheme<T>>();
    final theme = context.inheritFromWidgetOfExactType(type) as YXTheme<T>;

    return theme?.data;
  }
}

