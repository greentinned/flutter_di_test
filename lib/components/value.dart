import 'package:flutter/material.dart';

class Value extends StatefulWidget {
  Value({
    Key key,
    this.text,
    this.textWidget,
  }) : super(key: key);

  final String text;
  final Widget textWidget;

  @override
  _ValueState createState() => _ValueState();
}

class _ValueState extends State<Value> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> animation;
  Color fromColor = Colors.orangeAccent;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final parentStyle = DefaultTextStyle.of(context).style;
    final toColor = parentStyle.color;

    animation = ColorTween(
      begin: fromColor,
      end: toColor,
    ).animate(controller)
      ..addListener(() => setState(() => {}));

    controller.forward();
  }

  @override
  void didUpdateWidget(Value oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text ||
        widget.textWidget != oldWidget.textWidget) {
      controller.reset();
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final parentStyle = DefaultTextStyle.of(context).style;

    return widget.textWidget ??
        Text(
          widget.text,
          style: parentStyle.copyWith(color: animation.value),
        );
  }
}
