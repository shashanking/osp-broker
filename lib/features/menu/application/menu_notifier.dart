import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/menu_state.dart';

class MenuNotifier extends StateNotifier<MenuState> {
  MenuNotifier() : super(const MenuState(selectedMenu: 'HOME'));

  void selectMenu(String menu) {
    state = state.copyWith(selectedMenu: menu);
  }
}

final menuNotifierProvider = StateNotifierProvider<MenuNotifier, MenuState>((ref) {
  return MenuNotifier();
});
