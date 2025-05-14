
import 'package:deckhub/flatpak/base.dart';
import 'package:deckhub/flatpak/installed_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'flatpak.g.dart';

@riverpod
Future<List<InstalledApp>> installedApps(Ref ref) {
  return FlatpakApi.instance.listInstalledApps();
}

@riverpod
Future<List<InstalledApp>> installedAppsWithUpdates(Ref ref) {
  return FlatpakApi.instance.listUpdatableApps();
}

