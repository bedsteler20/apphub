import 'package:deckhub/api/app_of_the_day.dart';
import 'package:deckhub/api/appstream.dart';
import 'package:deckhub/api/pagination.dart';
import 'package:deckhub/api/summary.dart';
import 'package:deckhub/flatpak/ffi.dart';
import 'package:deckhub/flatpak/installed_app.dart';
import 'package:deckhub/providers/flathub.dart';
import 'package:deckhub/providers/flatpak.dart';
import 'package:deckhub/utils/std.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pages.g.dart';

typedef AppPageData = ({
  FlathubAppstream appstream,
  FlathubSummary summary,
  List<FlathubAppHit> devsOtherApps,
  InstalledApp? installedApp,
});

@riverpod
Future<AppPageData> appPage(Ref ref, String appId) async {
  FlathubAppstream? appstream;
  FlathubSummary? summary;
  List<FlathubAppHit> devsOtherApps = [];
  InstalledApp? installedApp;

  await Future.wait([
    ref.watch(summaryProvider(appId).future).then((value) => summary = value),
    ref.watch(appstreamProvider(appId).future).then((value) async {
      appstream = value;
      if (value.developerName != null) {
        final apps = await ref.watch(
            developerProvider(value.developerName!, page: 1, pageSize: 6)
                .future);
        devsOtherApps = apps.hits.where((e) => e.appId != appId).toList();
      }
    }),
    ref.watch(installedAppsProvider.future).then((value) {
      installedApp = value.firstWhereOrNull(
        (e) => e.name == appId,
      );
    }),
  ]);

  return (
    appstream: appstream!,
    summary: summary!,
    devsOtherApps: devsOtherApps,
    installedApp: installedApp,
  );
}

typedef HomePageData = ({
  List<FlathubAppstream> appsOfTheWeek,
  FlathubAppstream appOfTheDay,
  RecommendedApp circleAppOfTheDay,
  FlathubPagination popularApps,
  FlathubPagination newApps,
  FlathubPagination updatedApps,
  FlathubPagination trendingApps,
});

@riverpod
Future<HomePageData> homePage(Ref ref) async {
  List<FlathubAppstream>? appsOfTheWeek;
  FlathubAppstream? appOfTheDay;
  RecommendedApp? circleAppOfTheDay;
  FlathubPagination? popularApps;
  FlathubPagination? newApps;
  FlathubPagination? updatedApps;
  FlathubPagination? trendingApps;

  await Future.wait<void>([
    ref.watch(appOfTheDayProvider.future).then((value) => appOfTheDay = value),
    ref
        .watch(appsOfTheWeekProvider.future)
        .then((value) => appsOfTheWeek = value),
    ref
        .watch(circleAppOfTheDayProvider.future)
        .then((value) => circleAppOfTheDay = value),
    ref
        .watch(newAppsProvider(page: 1, pageSize: 12).future)
        .then((value) => newApps = value),
    ref
        .watch(popularAppsProvider(page: 1, pageSize: 12).future)
        .then((value) => popularApps = value),
    ref
        .watch(updatedAppsProvider(page: 1, pageSize: 12).future)
        .then((value) => updatedApps = value),
    ref
        .watch(trendingAppsProvider(page: 1, pageSize: 12).future)
        .then((value) => trendingApps = value),
  ]);

  return (
    appsOfTheWeek: appsOfTheWeek!,
    appOfTheDay: appOfTheDay!,
    circleAppOfTheDay: circleAppOfTheDay!,
    popularApps: popularApps!,
    newApps: newApps!,
    updatedApps: updatedApps!,
    trendingApps: trendingApps!,
  );
}

typedef InstalledPageData = ({
  List<InstalledApp> apps,
  List<InstalledApp> runtimes,
  List<InstalledApp> updates,
});

@riverpod
Future<InstalledPageData> installedPage(Ref ref) async {
  List<InstalledApp>? apps;
  List<InstalledApp>? runtimes;
  List<InstalledApp>? updates;

  await Future.wait<void>([
    ref.watch(installedAppsProvider.future).then((value) {
      apps = value.where((app) => app.kind == FlatpakRefKind.app).toList();
      runtimes =
          value.where((app) => app.kind == FlatpakRefKind.runtime).toList();
    }),
    ref
        .watch(installedAppsWithUpdatesProvider.future)
        .then((value) => updates = value),
  ]);
  return (
    apps: apps!,
    runtimes: runtimes!,
    updates: updates!,
  );
}
