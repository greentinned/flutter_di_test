import 'package:di_test/components/button.dart';
import 'package:di_test/exp/button.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

final ButtonWithExp buttonLibWithExp = (ButtonBuilder builder) => YXButton(
      title: builder.title,
    );
