import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_config/native_config_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNativeConfig platform = MethodChannelNativeConfig();
  const MethodChannel channel = MethodChannel('native_config');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.versionName(), '42');
  });
}
