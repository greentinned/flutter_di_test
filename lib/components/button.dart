import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import './typo.dart';

class ButtonBuilder {
  ButtonBuilder({
    this.title,
  });

  final String title;

  ButtonBuilder copyWith({
    String title,
  }) {
    return ButtonBuilder(
      title: title ?? this.title,
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
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: YXColors.gray175,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(builder.title, style: body),
    );
  }
}
