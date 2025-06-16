import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthBoxNotifier extends StateNotifier<Box> {
  AuthBoxNotifier(Box box) : super(box);
  
  void updateBox(Box newBox) {
    state = newBox;
  }
}

final authBoxProvider = StateNotifierProvider<AuthBoxNotifier, Box>((ref) {
  // This will be overridden in main.dart
  return AuthBoxNotifier(Hive.box('temp_auth_box'));
});
