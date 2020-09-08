import 'package:counter/data/settings.dart';
import 'package:flutter/cupertino.dart';

class SettingsProvider extends InheritedWidget {
  SettingsProvider({Key key, Widget child, this.settings}) : super(key: key, child: child);

  final Settings settings;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static SettingsProvider of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<SettingsProvider>();
}
