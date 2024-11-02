import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_switch.g.dart';

@Riverpod(keepAlive: true)
class SettingSwitch extends _$SettingSwitch {
  @override
  bool build() => true;

  void changeBool() {
    if (state == false) {
      state = true;
    } else {
      state = false;
    }
  }
}
