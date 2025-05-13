import 'package:deckhub/flatpak/base.dart';
import 'package:deckhub/router.dart';
import 'package:flutter/material.dart';
import 'package:flux/flux.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  await FlatpakApi.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Flux.ensureInitialized();
  runApp(ProviderScope(
    child: App(),
  ));
}

class App extends StatelessWidget {
  App({super.key});

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Apphub',
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
      theme: generateFluxTheme(),
    );
  }
}
