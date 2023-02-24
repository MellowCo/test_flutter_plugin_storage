import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'stroage_platform_interface.dart';

/// An implementation of [StroagePlatform] that uses method channels.
class MethodChannelStroage extends StroagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('stroage');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> sayHello() async {
    return "MethodChannelStroage say hello";
  }
}
