import 'package:flutter/widgets.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart'
    hide YXTheme, YXThemeData;

import 'button.dart';
import 'theme.dart';
import 'theme_data.dart';

class ButtonProgressProps with YXMergeable<ButtonProgressProps> {
  ButtonProgressProps({
    String title,
    String subtitle,
    this.progress,
  }) : buttonProps = ButtonProps(
          title: title,
          subtitle: subtitle,
          isAccent: true,
        );

  final double progress;
  final ButtonProps buttonProps;

  @override
  ButtonProgressProps merge(ButtonProgressProps override) {
    return ButtonProgressProps(
      title: override.buttonProps.title ?? this.buttonProps.title,
      progress: override.progress ?? this.progress,
    );
  }
}

class ButtonProgress extends StatelessWidget {
  ButtonProgress(
    this.props, {
    Key key,
  }) : super(key: key);

  final ButtonProgressProps props;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = YXTheme.of<YXThemeData>(context).buttonTheme;
    final overridedButtonTheme = YXTheme.of<ButtonThemeData>(context);
    final resultButtonTheme = buttonTheme.merge(overridedButtonTheme).merge(
          ButtonThemeData(
            height: mu(10),
            titleStyle: buttonTheme.titleStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        );

    /// Можно не копировать базовую тему,
    /// так мы не навредим компонентам внутри
    return YXTheme(
      data: resultButtonTheme,
      child: Button(
        props.buttonProps,
      ),
    );
  }
}
