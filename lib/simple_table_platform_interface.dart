import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'simple_table_method_channel.dart';

abstract class SimpleTablePlatform extends PlatformInterface {
  /// Constructs a SimpleTablePlatform.
  SimpleTablePlatform() : super(token: _token);

  static final Object _token = Object();

  static SimpleTablePlatform _instance = MethodChannelSimpleTable();

  /// The default instance of [SimpleTablePlatform] to use.
  ///
  /// Defaults to [MethodChannelSimpleTable].
  static SimpleTablePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimpleTablePlatform] when
  /// they register themselves.
  static set instance(SimpleTablePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
