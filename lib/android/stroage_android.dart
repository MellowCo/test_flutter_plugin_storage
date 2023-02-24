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
}
