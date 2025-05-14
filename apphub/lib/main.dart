import 'package:deckhub/flatpak/base.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/providers/settings.dart';
import 'package:deckhub/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flux/flux.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await FlatpakApi.init();
  await Settings.ensureInitialized();
  await Flux.ensureInitialized();
  // ignore: missing_provider_scope
  runApp(TranslationProvider(
    child: ProviderScope(
      child: App(),
    ),
  ));
}

class App extends StatelessWidget {
  App({super.key});

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: t.appName,
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
      locale: TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: generateFluxTheme(fontFamily: "Adwaita Sans"),
    );
  }
}
