
import 'simple_table_platform_interface.dart';

class SimpleTable {
  Future<String?> getPlatformVersion() {
    return SimpleTablePlatform.instance.getPlatformVersion();
  }
}
