import 'package:deckhub/flatpak/messaging.dart';
import 'package:deckhub/flatpak/native.dart';

void main(List<String> args) async {
  final server = MessageServer();
  await FlatpakNativeApi.init();
  final api = FlatpakNativeApi();

  server.handleMessage("listInstalledApps", (msg) {
    return api
        .listInstalledApps()
        .then((apps) => apps.map((e) => e.toJson()).toList());
  });

  server.handleMessage("listUpdatableApps", (msg) {
    return api
        .listUpdatableApps()
        .then((apps) => apps.map((e) => e.toJson()).toList());
  });
}
