
import 'native_config_platform_interface.dart';

class NativeConfig {
  Future<String?> versionName() {
    return NativeConfigPlatform.instance.versionName();
  }

  Future<int?> versionCode() {
    return NativeConfigPlatform.instance.versionCode();
  }
}
