import 'package:di_test/exp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'components/button.dart';
import 'components/value.dart';

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exp = ExperimentProvider.of(context);

    final inheritedStyleText = 'Inherited';
    final customStyleText = 'Custom styles';
    final customWidgetText = '93/100';

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              // List Item simulation default style simulation
              DefaultTextStyle(
                style: YXTypography.body.copyWith(color: YXColors.greenToxic),
                child: Value(text: inheritedStyleText),
              ),
              // Custom style
              Value(
                text: customStyleText,
                builder: (context, text, animatedValue) => Text(
                  text,
                  style: YXTypography.headerLight.copyWith(
                    color: animatedValue,
                  ),
                ),
              ),
              Value(
                text: customStyleText,
                style:
                    YXTypography.headerLight.copyWith(color: YXColors.gray300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  DefaultTextStyle(
                    style: YXTypography.headerLight.copyWith(
                      color: YXColors.black,
                    ),
                    child: Value(
                      text: customWidgetText.split('/').first,
                    ),
                  ),
                  DefaultTextStyle(
                    style: YXTypography.body.copyWith(
                      color: YXColors.gray300,
                    ),
                    child: Value(
                      text: '/${customWidgetText.split('/').last}',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(ButtonBuilder(title: 'A Button')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: exp.button(ButtonBuilder(title: 'Button from exp')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
