import 'package:flutter_test/flutter_test.dart';
import 'package:stroage/stroage.dart';
import 'package:stroage/stroage_platform_interface.dart';
import 'package:stroage/stroage_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockStroagePlatform
    with MockPlatformInterfaceMixin
    implements StroagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final StroagePlatform initialPlatform = StroagePlatform.instance;

  test('$MethodChannelStroage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStroage>());
  });

  test('getPlatformVersion', () async {
    Stroage stroagePlugin = Stroage();
    MockStroagePlatform fakePlatform = MockStroagePlatform();
    StroagePlatform.instance = fakePlatform;

    expect(await stroagePlugin.getPlatformVersion(), '42');
  });
}
