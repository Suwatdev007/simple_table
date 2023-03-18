import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'simple_table_platform_interface.dart';

/// An implementation of [SimpleTablePlatform] that uses method channels.
class MethodChannelSimpleTable extends SimpleTablePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('simple_table');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
