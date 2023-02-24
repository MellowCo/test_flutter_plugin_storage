import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:stroage/stroage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _stroagePlugin = Stroage();
  int count = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _stroagePlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    String str = await _stroagePlugin.sayHello() ?? '';
                    print("flutter hello: $str");
                  } catch (e) {
                    print("flutter hello error: $e");
                  }
                },
                child: const Text('hello')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    String str = await _stroagePlugin.getPlatform() ?? '';
                    print("flutter hello: $str");
                  } on UnimplementedError {
                    print("该平台暂不支持该功能");
                  }
                },
                child: const Text('platform')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    String value =
                        await _stroagePlugin.get("stroage_key") ?? '';
                    print("flutter get value: $value");
                  } catch (e) {
                    print("flutter get error: $e");
                  }
                },
                child: const Text('get')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await _stroagePlugin.set("stroage_key", "$count") ?? '';
                    setState(() {
                      count = count + 1;
                    });
                  } catch (e) {
                    print("flutter get error: $e");
                  }
                },
                child: const Text('set')),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            Center(
              child: Text('count: $count\n'),
            ),
          ],
        ),
      ),
    );
  }
}
