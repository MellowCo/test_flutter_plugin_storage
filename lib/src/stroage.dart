import 'stroage_platform_interface.dart';

class Stroage {
  Future<String?> getPlatformVersion() {
    return StroagePlatform.instance.getPlatformVersion();
  }

  Future<String?> sayHello() {
    return StroagePlatform.instance.sayHello();
  }

  Future<String?> getPlatform() {
    return StroagePlatform.instance.getPlatform();
  }

  Future<String?> get(String key) {
    return StroagePlatform.instance.get(key);
  }

  Future<String?> set(String key, String value) {
    return StroagePlatform.instance.set(key, value);
  }
}
