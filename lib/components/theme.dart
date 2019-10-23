import 'package:flutter/widgets.dart';

class Theme<T> extends InheritedWidget {
  Theme({
    Key key,
    this.data,
    Widget child,
  }) : super(key: key, child: child);

  final T data;

  @override
  bool updateShouldNotify(Theme oldWidget) {
    return data != oldWidget.data;
  }

  static Type _typeOf<T>() => T;

  static T of<T>(BuildContext context) {
    final type = _typeOf<Theme<T>>();
    final theme = context.inheritFromWidgetOfExactType(type) as Theme<T>;
    print(theme);

    return theme?.data;
  }
}

class ThemeData {
  ThemeData({this.colors});

  final ColorPalette colors;
}

class ColorPalette {
  ColorPalette({
    this.text,
    this.secondaryText,
    this.yellow,
    this.amber,
    this.red,
  });

  final Color text;
  final Color secondaryText;
  final Color yellow;
  final Color amber;
  final Color red;
}
