import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import '../components/button.dart' hide Button;
import '../components/typo.dart';

class Button extends StatelessWidget {
  Button(this.builder, {Key key}) : super(key: key);

  final ButtonBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: YXColors.yellowToxic,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        builder.title,
        style: body,
      ),
    );
  }
}

typedef ButtonWithExp<T> = T Function(ButtonBuilder builder);
final ButtonWithExp buttonWithExp = (ButtonBuilder builder) => Button(builder);
