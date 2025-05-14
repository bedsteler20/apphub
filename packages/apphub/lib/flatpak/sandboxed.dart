import 'dart:io';

import 'package:deckhub/flatpak/base.dart';
import 'package:deckhub/flatpak/installed_app.dart';
import 'package:deckhub/flatpak/messaging.dart';

class FlatpakSandboxedApi extends FlatpakApi {
  static late final MessageClient _client;

  static Future<void> init() async {
    final appPath = File("/.flatpak-info")
        .readAsLinesSync()
        .firstWhere((l) => l.startsWith("app-path="))
        .split("=")[1];
    final process = await Process.start("flatpak-spawn",
        ["--host", "$appPath/apphub_host"]);

    _client = MessageClient(process);
  }

  @override
  Future<List<InstalledApp>> listInstalledApps() async {
    final res = await _client.send(Message.request("listInstalledApps", null));
    return (res.data as List).map((e) => InstalledApp.fromJson(e)).toList();
  }

  @override
  Future<List<InstalledApp>> listUpdatableApps() async {
    final res = await _client.send(Message.request("listUpdatableApps", null));
    return (res.data as List).map((e) => InstalledApp.fromJson(e)).toList();
  }
}
