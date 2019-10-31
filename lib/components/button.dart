import 'package:flutter/material.dart' hide Theme, ThemeData, ButtonThemeData;
import 'package:flutter_ui_components/flutter_ui_components.dart'
    hide YXTheme, YXThemeData;

import 'theme.dart';
import 'theme_data.dart';
import 'button_theme_data.dart';
export 'button_theme_data.dart';

class ButtonProps with YXMergeable<ButtonProps> {
  ButtonProps({
    this.title,
    this.subtitle,
    this.isAccent = false,
  });

  final String title;
  final String subtitle;
  final bool isAccent;

  @override
  ButtonProps merge(ButtonProps override) {
    return ButtonProps(
      title: override.title ?? title,
      isAccent: override.isAccent ?? isAccent,
    );
  }
}

class Button extends StatelessWidget {
  Button(
    this.builder, {
    Key key,
  }) : super(key: key);

  final ButtonProps builder;

  @override
  Widget build(BuildContext context) {
    /// Всегда верхний уровень темы
    final buttonTheme = YXTheme.of<YXThemeData>(context).buttonTheme;

    /// Переопределение где-то по середине,
    /// не повиляет на использованные компоненты ниже уровнем
    final overrideButtonTheme = YXTheme.of<ButtonThemeData>(context);

    /// Финальная тема с учетом модификаций `fromProps`
    final resultButtonTheme =
        buttonTheme.merge(overrideButtonTheme).fromProps(builder);

    return Container(
      height: resultButtonTheme.height,
      padding: EdgeInsets.symmetric(horizontal: mu(2)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: resultButtonTheme.background,
        borderRadius: resultButtonTheme.borderRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            builder.title,
            style: resultButtonTheme.titleStyle,
          ),
          if (builder.subtitle != null)
            Text(
              builder.subtitle,
              style: resultButtonTheme.subtitleStyle,
            ),
        ],
      ),
    );
  }
}
