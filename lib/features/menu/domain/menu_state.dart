import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState({
    required String selectedMenu,
  }) = _MenuState;
}
 