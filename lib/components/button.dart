import 'package:flutter/material.dart' hide Theme, ThemeData;
import 'package:di_test/components/theme.dart';
import './typo.dart';

class ButtonBuilder {
  ButtonBuilder({
    this.title,
  });

  final String title;

  Widget get normal {
    return Theme(
      data: ButtonThemeData(
        bg: Colors.grey,
      ),
      child: Button(this),
    );
  }

  Widget get accent {
    return Theme(
      data: ButtonThemeData(
        bg: Colors.amberAccent,
      ),
      child: Button(this),
    );
  }
}

class ButtonThemeData {
  ButtonThemeData({
    this.bg,
  });

  final Color bg;
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
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        builder.title,
        style: body.copyWith(color: theme.colors.text),
      ),
    );
  }
}
