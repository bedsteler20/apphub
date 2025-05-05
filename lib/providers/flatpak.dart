import 'dart:io';
import 'dart:isolate';

import 'package:deckhub/native/flatpak.dart';
import 'package:deckhub/utils/std.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'flatpak.g.dart';
part 'flatpak.freezed.dart';

@riverpod
FlatpakInstallation userInstallation(Ref ref) {
  return FlatpakInstallation.user();
}

@riverpod
FlatpakInstallation systemInstallation(Ref ref) {
  return FlatpakInstallation.system();
}

@riverpod
List<InstalledApp> installedApps(Ref ref) {
  final installs = [
    ref.read(userInstallationProvider),
    ref.read(systemInstallationProvider),
  ];

  final newApps = <InstalledApp>[];

  for (final install in installs) {
    final apps = install.listInstalledRefs();
    for (final app in apps) {
      if (app.origin != "flathub") continue;
      if (app.name.endsWith(".Locale")) continue;
      if (app.name.endsWith(".Codecs")) continue;
      if (app.name.endsWith(".Debug")) continue;
      if (app.name.endsWith(".i386")) continue;

      final installedApp = InstalledApp.fromFlatpakRef(app, install);
      newApps.add(installedApp);
    }
    apps.free();
  }
  return newApps;
}

@riverpod
Future<List<InstalledApp>> installedAppsWithUpdates(Ref ref) {
  final installs = [
    ref.read(userInstallationProvider),
    ref.read(systemInstallationProvider),
  ];
  // FlatpakInstallation.listInstalledRefsForUpdate blocks the main thread
  // so we need to run it in an isolate

  return Isolate.run<List<InstalledApp>>(() async {
    final newApps = <InstalledApp>[];

    for (final install in installs) {
      final apps = install.listInstalledRefsForUpdate();
      for (final app in apps) {
        if (app.origin != "flathub") continue;
        if (app.name.endsWith(".Locale")) continue;
        if (app.name.endsWith(".Codecs")) continue;
        if (app.name.endsWith(".Debug")) continue;
        if (app.name.endsWith(".i386")) continue;

        final installedApp = InstalledApp.fromFlatpakRef(app, install);
        newApps.add(installedApp);
      }
      apps.free();
      install.unref();
    }
    return newApps;
  });
}

@riverpod
InstalledApp? installedApp(Ref ref, String appId) {
  final apps = ref.watch(installedAppsProvider);
  return apps.firstWhereOrNull((app) => app.name == appId);
}

@freezed
class InstalledApp with _$InstalledApp {
  const factory InstalledApp({
    required String name,
    required String arch,
    required String branch,
    required String commit,
    required String? collectionId,
    required FlatpakRefKind kind,
    required String? appdataName,
    required bool isCurrent,
    required int installedSize,
    required String? deployDir,
    required String? latestCommit,
    required String? origin,
    required String? appdataLicense,
    required String? appdataVersion,
    required String? appdataSummary,
    required String? eol,
    required String? eolRebase,
    required bool isUser,
    required File? icon,
  }) = _InstalledApp;

  factory InstalledApp.fromFlatpakRef(
    FlatpakInstalledRef app,
    FlatpakInstallation install,
  ) {
    final base = install.isUser
        ? "${Platform.environment["HOME"]}/.local/share/flatpak"
        : "/var/lib/flatpak";

    final path =
        "$base/appstream/${app.origin}/${app.arch}/active/icons/128x128/${app.name}.png";
    final file = File(path);
    return InstalledApp(
      name: app.name,
      arch: app.arch,
      branch: app.branch,
      commit: app.commit,
      collectionId: app.collectionId,
      kind: app.kind,
      appdataName: app.appdataName,
      isCurrent: app.isCurrent,
      installedSize: app.installedSize,
      deployDir: app.deployDir,
      latestCommit: app.latestCommit,
      origin: app.origin,
      appdataLicense: app.appdataLicense,
      appdataVersion: app.appdataVersion,
      appdataSummary: app.appdataSummary,
      eol: app.eol,
      eolRebase: app.eolRebase,
      isUser: install.isUser,
      icon: file.existsSync() ? file : null,
    );
  }
}
