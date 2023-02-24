import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../src/stroage_platform_interface.dart';

class StroageAndroid extends StroagePlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('stroage');

  // 通过 registerWith 注册到 StroagePlatform 示例中
  static void registerWith() {
    StroagePlatform.instance = StroageAndroid();
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> sayHello() async {
    return "StroageAndroid say hello";
  }

  @override
  Future<String?> getPlatform() async {
    return "StroageAndroid 安卓平台";
  }

  @override
  Future<String?> get(String key) async {
    final value = await methodChannel
        .invokeMethod<String>('get', <String, String>{'key': key});
    return value;
  }

  @override
  Future<String?> set(String key, String value) async {
    await methodChannel.invokeMethod<String>(
        'set', <String, dynamic>{'key': key, 'value': value});
    return null;
  }
}
