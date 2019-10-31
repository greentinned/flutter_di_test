import 'package:di_test/components/button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'color_scheme.dart';
import 'text_styles.dart';
import 'mixin/mixin.dart';

export 'mixin/mixin.dart';

class YXThemeData with YXMergeable<YXThemeData> {
  YXThemeData({
    this.colorScheme,
    this.textStyles,
    this.buttonTheme,
  });

  final YXColorScheme colorScheme;
  final YXTextStyles textStyles;
  final ButtonThemeData buttonTheme;

  @override
  YXThemeData merge(YXThemeData theme) {
    return YXThemeData(
      textStyles: theme.textStyles ?? this.textStyles,
      colorScheme: theme.colorScheme ?? this.colorScheme,
      buttonTheme: theme.buttonTheme ?? this.buttonTheme,
    );
  }

  ///
  /// Common
  ///
  static YXTextStyles get defaultTextStyles {
    return YXTextStyles(
      title: TextStyle(
        fontFamily: 'Yandex Sans Text',
        fontWeight: FontWeight.normal,
        fontSize: 26,
        height: 32 / 26,
      ),
      body: TextStyle(
        fontFamily: 'Yandex Sans Text',
        fontWeight: FontWeight.normal,
        fontSize: 20,
        height: 24 / 20,
      ),
      caption: TextStyle(
        fontFamily: 'Yandex Sans Text',
        fontWeight: FontWeight.normal,
        fontSize: 16,
        height: 19 / 16,
      ),
    );
  }

  ///
  /// Light Theme
  ///
  static YXThemeData get light {
    return YXThemeData(
      textStyles: defaultTextStyles,
      colorScheme: YXColorScheme(
        pageBackground: YXColors.white,
        textNormal: YXColors.black,
        textHint: YXColors.gray300,
        divider: YXColors.gray200,
        red: YXColors.redToxic,
        amber: YXColors.amberToxic,
        yellow: YXColors.yellowToxic,
        green: YXColors.greenToxic,
        blue: YXColors.blueToxic,
        purple: YXColors.purpleToxic,
      ),
      buttonTheme: ButtonThemeData.light,
    );
  }

  ///
  /// Dark Theme
  ///
  static YXThemeData get dark {
    return YXThemeData(
      textStyles: defaultTextStyles,
      colorScheme: YXColorScheme(
        pageBackground: YXColors.trueBlack,
        textNormal: YXColors.white,
        textHint: YXColors.gray300,
        divider: YXColors.gray500,
        red: YXColors.redLight,
        amber: YXColors.amberLight,
        yellow: YXColors.yellowLight,
        green: YXColors.greenLight,
        blue: YXColors.blueLight,
        purple: YXColors.purpleLight,
      ),
      buttonTheme: ButtonThemeData.dark,
    );
  }
}
