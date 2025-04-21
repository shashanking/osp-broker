// Core infrastructure: Hive Flutter setup
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static Future<void> init() async {
    await Hive.initFlutter();
    // Register adapters and open boxes as needed
  }
}
