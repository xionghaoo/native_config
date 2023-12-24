import 'package:flutter_test/flutter_test.dart';
import 'package:native_config/native_config.dart';
import 'package:native_config/native_config_platform_interface.dart';
import 'package:native_config/native_config_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeConfigPlatform
    with MockPlatformInterfaceMixin
    implements NativeConfigPlatform {

  @override
  Future<String> versionName() => Future.value('42');

  @override
  Future<int> versionCode() {
    return Future(() => 0);
  }
}

void main() {
  final NativeConfigPlatform initialPlatform = NativeConfigPlatform.instance;

  test('$MethodChannelNativeConfig is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeConfig>());
  });

  test('getPlatformVersion', () async {
    NativeConfig nativeConfigPlugin = NativeConfig();
    MockNativeConfigPlatform fakePlatform = MockNativeConfigPlatform();
    NativeConfigPlatform.instance = fakePlatform;

    expect(await nativeConfigPlugin.versionName(), '42');
  });
}
