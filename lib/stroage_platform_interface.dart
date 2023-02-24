import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'stroage_method_channel.dart';

abstract class StroagePlatform extends PlatformInterface {
  /// Constructs a StroagePlatform.
  StroagePlatform() : super(token: _token);

  static final Object _token = Object();

  static StroagePlatform _instance = MethodChannelStroage();

  /// The default instance of [StroagePlatform] to use.
  ///
  /// Defaults to [MethodChannelStroage].
  static StroagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StroagePlatform] when
  /// they register themselves.
  static set instance(StroagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
