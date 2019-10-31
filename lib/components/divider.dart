import 'package:flutter/widgets.dart';

import 'theme.dart';
import 'theme_data.dart';

class Divider extends StatelessWidget {
  const Divider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = YXTheme.of<YXThemeData>(context);

    return Container(
      color: theme.colorScheme.divider,
      height: .5,
    );
  }
}
