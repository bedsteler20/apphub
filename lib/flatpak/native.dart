import 'dart:isolate';

import 'package:deckhub/flatpak/base.dart';
import 'package:deckhub/flatpak/ffi.dart';
import 'package:deckhub/flatpak/installed_app.dart';

class FlatpakNativeApi extends FlatpakApi {
  static Future<void> init() async {
    initLibFlatpak();
  }

  final installs = <FlatpakInstallation>[
    FlatpakInstallation.user(),
    FlatpakInstallation.system(),
  ];

  @override
  Future<List<InstalledApp>> listInstalledApps() async {
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

  @override
  Future<List<InstalledApp>> listUpdatableApps() async {
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
          app.unref();
        }
        apps.free();
        install.unref();
      }
      return newApps;
    });
  }
}
