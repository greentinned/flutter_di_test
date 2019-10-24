import 'package:flutter/material.dart' hide Theme, ThemeData;
import 'package:di_test/components/theme.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

class ButtonBuilder {
  ButtonBuilder({
    this.title,
  });

  final String title;

  Widget get normal {
    return Theme(
      data: ButtonThemeData(
        bg: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Button(this),
    );
  }

  Widget get accent {
    return Theme(
      data: ButtonThemeData(
        bg: Colors.amberAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: normal,
    );
  }
}

class ButtonThemeData with MergableThemeData<ButtonThemeData> {
  ButtonThemeData({this.bg, this.borderRadius});

  final Color bg;
  final BorderRadius borderRadius;

  @override
  merge(theme) {
    return ButtonThemeData(
      bg: theme.bg ?? this.bg,
      borderRadius: theme.borderRadius ?? this.borderRadius,
    );
  }
}

class Button extends StatelessWidget {
  Button(
    this.builder, {
    Key key,
  }) : super(key: key);

  final ButtonBuilder builder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of<ThemeData>(context);
    final buttonTheme = Theme.of<ButtonThemeData>(context);

    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: buttonTheme.bg,
        borderRadius: buttonTheme.borderRadius,
      ),
      child: Text(
        builder.title,
        style: YXTypography.body.copyWith(color: theme.colors.text),
      ),
    );
  }
}
