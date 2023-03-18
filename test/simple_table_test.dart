import 'package:flutter_test/flutter_test.dart';
import 'package:simple_table/simple_table_platform_interface.dart';
import 'package:simple_table/simple_table_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSimpleTablePlatform
    with MockPlatformInterfaceMixin
    implements SimpleTablePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SimpleTablePlatform initialPlatform = SimpleTablePlatform.instance;

  test('$MethodChannelSimpleTable is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSimpleTable>());
  });

  // test('getPlatformVersion', () async {
  //   SimpleTable simpleTablePlugin = SimpleTable();
  //   MockSimpleTablePlatform fakePlatform = MockSimpleTablePlatform();
  //   SimpleTablePlatform.instance = fakePlatform;
  //
  //   expect(await simpleTablePlugin.getPlatformVersion(), '42');
  // });
}
