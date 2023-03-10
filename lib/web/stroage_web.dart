// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import '../src/stroage_platform_interface.dart';

class StroageWeb extends StroagePlatform {
  /// Constructs a StroageWeb
  StroageWeb();

  static void registerWith(Registrar registrar) {
    StroagePlatform.instance = StroageWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<String?> sayHello() async {
    return "StroageWeb say hello";
  }

  @override
  Future<String?> get(String key) async {
    return html.window.localStorage[key] ?? "web中没有数据";
  }

  @override
  Future<String?> set(String key, String value) async {
    html.window.localStorage.addEntries([MapEntry(key, value)]);
    return null;
  }
}
