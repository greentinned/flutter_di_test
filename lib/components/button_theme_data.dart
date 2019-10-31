import 'package:flutter/widgets.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart'
    hide YXTheme, YXThemeData;

import 'button.dart';
import 'theme_data.dart';

class ButtonThemeData
    with YXMergeable<ButtonThemeData>, YXProps<ButtonThemeData, ButtonProps> {
  ButtonThemeData({
    this.background,
    this.backgroundAccent,
    this.height,
    this.borderRadius,
    this.titleStyle,
    this.subtitleStyle,
    this.padding,
  });

  final Color background;
  final Color backgroundAccent;
  final double height;
  final BorderRadius borderRadius;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final double padding;

  @override
  ButtonThemeData merge(ButtonThemeData theme) {
    return ButtonThemeData(
      background: theme?.background ?? this.background,
      height: theme?.height ?? this.height,
      borderRadius: theme?.borderRadius ?? this.borderRadius,
      titleStyle: theme?.titleStyle ?? this.titleStyle,
      subtitleStyle: theme?.subtitleStyle ?? this.subtitleStyle,
    );
  }

  /// Модифицируется отдельным методом, исключаем путаницу:
  /// модификатор в теме или модификатор в компоненте
  @override
  ButtonThemeData fromProps(ButtonProps props) {
    return this.merge(ButtonThemeData(
      background: props.isAccent ? YXColors.yellowToxic : this.background,
      titleStyle: props.isAccent
          ? this.titleStyle.copyWith(color: YXColors.black)
          : this.titleStyle,
    ));
  }

  static ButtonThemeData get light {
    return ButtonThemeData(
      background: YXColors.gray175,
      height: mu(8),
      borderRadius: BorderRadius.circular(mu(1)),
      titleStyle: YXThemeData.defaultTextStyles.body.copyWith(
        color: YXColors.black,
      ),
      subtitleStyle: YXThemeData.defaultTextStyles.caption.copyWith(
        color: YXColors.black,
      ),
    );
  }

  static ButtonThemeData get dark {
    return ButtonThemeData.light.merge(
      ButtonThemeData(
        background: YXColors.gray500,
        titleStyle: YXThemeData.defaultTextStyles.body.copyWith(
          color: YXColors.white,
        ),
        subtitleStyle: YXThemeData.defaultTextStyles.caption.copyWith(
          color: YXColors.white,
        ),
      ),
    );
  }
}
