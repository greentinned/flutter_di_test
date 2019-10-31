import 'package:flutter/material.dart'
    hide Theme, ThemeData, ButtonThemeData, Divider;
import 'package:flutter_ui_components/flutter_ui_components.dart'
    hide YXTheme, YXThemeData;

import 'components/button.dart';
import 'components/button_progress.dart';
import 'components/divider.dart';
import 'components/theme.dart';
import 'components/theme_data.dart';

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = YXTheme.of<YXThemeData>(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.pageBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(mu(1)),
                child: Button(ButtonProps(
                  title: 'A Normal Button',
                )),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(mu(1)),
                child: Button(ButtonProps(
                  title: 'An Accent Button',
                  isAccent: true,
                )),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(mu(1)),
                child: ButtonProgress(
                  ButtonProgressProps(
                    title: 'A Progress Button',
                    subtitle: '420 ₽',
                    progress: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
