import 'package:flutter/widgets.dart';

class Theme<T extends MergableThemeData> extends InheritedWidget {
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

  Theme parent(BuildContext context) {
    final type = _typeOf<Theme<T>>();
    return context.inheritFromWidgetOfExactType(type) as Theme<T>;
  }

  static T of<T extends MergableThemeData>(BuildContext context) {
    final type = _typeOf<Theme<T>>();
    final theme = context.inheritFromWidgetOfExactType(type) as Theme<T>;

    // while (theme.parent(context) != null) {
    //   print(theme.parent(context).data);
    // }

    // return theme?.data?.merge(theme.parent(context));

    return theme?.data;
  }
}

mixin MergableThemeData<T> {
  T merge(T theme);
}

class ThemeData with MergableThemeData<ThemeData> {
  ThemeData({this.colors});

  final ColorPalette colors;

  @override
  ThemeData merge(ThemeData theme) {
    return ThemeData(colors: theme.colors ?? this.colors);
  }
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
