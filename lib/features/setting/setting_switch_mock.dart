import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_switch_mock.g.dart';

@Riverpod(keepAlive: true)
class SettingSwitchMock extends _$SettingSwitchMock {
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
