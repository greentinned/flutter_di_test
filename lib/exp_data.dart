import 'exp/button.dart';

// TODO: переделать в Map
class ExperimentData {
  ExperimentData({
    this.expName,
    this.button,
    this.buttonLib,
  });

  final String expName;
  final ButtonWithExp button;
  final ButtonWithExp buttonLib;
}
