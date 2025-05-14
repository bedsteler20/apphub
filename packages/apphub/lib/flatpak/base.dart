import 'dart:io';

import 'package:deckhub/flatpak/installed_app.dart';
import 'package:deckhub/flatpak/native.dart';
import 'package:deckhub/flatpak/sandboxed.dart';

final isSandBoxed = Platform.environment.containsKey('FLATPAK_ID');

abstract class FlatpakApi {
  Future<List<InstalledApp>> listInstalledApps();
  Future<List<InstalledApp>> listUpdatableApps();

  static late final FlatpakApi instance;

  static Future<void> init() async {
    if (isSandBoxed) {
      await FlatpakSandboxedApi.init();
      instance = FlatpakSandboxedApi();
    } else {
      FlatpakNativeApi.init();
      instance = FlatpakNativeApi();
    }
  }
}
