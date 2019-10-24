import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

/// A widget that highlights [text] diffs.
///
/// [text] string renders by [Text] widget and inherits [DefaultTextStyle],
/// therefore [Value] must be wrapped with [DefaultTextStyle] on some level.
///
/// {@tool-sample}
///
/// ```dart
/// DefaultTextStyle(
///   style: YXTypography.body.copyWith(
///     color: YXColors.greenToxic,
///   ),
///   child: Value(text: 'Value with inherited style'),
/// );
/// ```
///
/// {@end-tool}
///
/// If [builder] is provided, it still uses [text] as dependency to diff values.
/// Return any complex widget composition from [builder],
/// and use [animatedColor] to animate [Text] diffs.
///
/// {@tool-sample}
///
/// ```dart
/// DefaultTextStyle(
///   style: YXTypography.body.copyWith(
///     color: YXColors.greenToxic,
///   ),
///   child: Value(text: 'Value with inherited style'),
/// );
/// ```
///
/// {@end-tool}
///
class Value extends StatefulWidget {
  Value({
    Key key,
    @required this.text,
    this.style,
    this.builder,
  })  : assert(text != null, 'text is required'),
        super(key: key);

  final String text;
  final TextStyle style;
  final Widget Function(BuildContext context, String text, Color animatedColor)
      builder;

  @override
  _ValueState createState() => _ValueState();
}

class _ValueState extends State<Value> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> animation;
  Color fromColor = YXColors.amberToxic;

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
    final toColor = widget?.style?.color ?? parentStyle.color;

    animation = ColorTween(
      begin: fromColor,
      end: toColor,
    ).animate(controller)
      ..addListener(() => setState(() => {}));

    controller.forward(from: 1);
  }

  @override
  void didUpdateWidget(Value oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text) {
      controller.reset();
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultStyle = widget.style ?? DefaultTextStyle.of(context)?.style;

    return widget.builder != null
        ? widget.builder(context, widget.text, animation.value)
        : Text(
            widget.text,
            style: resultStyle.copyWith(color: animation.value),
          );
  }
}
