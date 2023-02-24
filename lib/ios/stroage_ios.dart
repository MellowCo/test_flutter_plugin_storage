/*
 * @Author: licl
 * @Date: 2023-02-24 13:02:21
 * @LastEditTime: 2023-02-24 13:59:22
 * @LastEditors: licl
 * @Description: 
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../src/stroage_platform_interface.dart';

/// An implementation of [StroagePlatform] that uses method channels.
class StroageIos extends StroagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('stroage');

  static void registerWith() {
    StroagePlatform.instance = StroageIos();
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
