
import 'dart:io';

import 'package:deckhub/flatpak/ffi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'installed_app.freezed.dart';
part 'installed_app.g.dart';

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
    required String? icon,
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
      icon: file.existsSync() ? file.path : null,
    );
  }

  factory InstalledApp.fromJson(Map<String, dynamic> json) =>
      _$InstalledAppFromJson(json);
}
