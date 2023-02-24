
import 'stroage_platform_interface.dart';

class Stroage {
  Future<String?> getPlatformVersion() {
    return StroagePlatform.instance.getPlatformVersion();
  }
}
