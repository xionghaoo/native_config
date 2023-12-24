import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_config_platform_interface.dart';

/// An implementation of [NativeConfigPlatform] that uses method channels.
class MethodChannelNativeConfig extends NativeConfigPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('xh.rabbit/native_config');

  @override
  Future<String?> versionName() async {
    final version = await methodChannel.invokeMethod<String>('versionName');
    return version;
  }

  @override
  Future<int?> versionCode() async {
    final code = await methodChannel.invokeMethod<int>('versionCode');
    return code;
  }
}
