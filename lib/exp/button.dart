import 'package:flutter/material.dart';
import '../components/typo.dart';
import '../components/button.dart' hide Button;

class Button extends StatelessWidget {
  Button(this.builder, {Key key}) : super(key: key);

  final ButtonBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Text(
        builder.title,
        style: body,
      ),
    );
  }
}

typedef ButtonWithExp = Button Function(ButtonBuilder builder);
final ButtonWithExp withExp = (ButtonBuilder builder) => Button(builder);
