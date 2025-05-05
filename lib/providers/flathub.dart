import 'dart:math';

import 'package:deckhub/api/app_of_the_day.dart';
import 'package:deckhub/api/appstream.dart';
import 'package:deckhub/api/client.dart';
import 'package:deckhub/api/pagination.dart';
import 'package:deckhub/api/search.dart';
import 'package:deckhub/api/summary.dart';
import 'package:deckhub/utils/std.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xdg_directories/xdg_directories.dart' as xdg;

part 'flathub.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  dio.options.headers['User-Agent'] = 'DeckHub/1.0';
  dio.interceptors.add(DioCacheInterceptor(
    options: CacheOptions(
      store: FileCacheStore('${xdg.cacheHome.path}/dev.bedsteler20.Deckhub'),
      allowPostMethod: false,
      policy: CachePolicy.refresh,
    ),
  ));
  return dio;
}

@riverpod
FlathubClient flathubClient(Ref ref) {
  final dio = ref.read(dioProvider);
  return FlathubClient(dio);
}

@riverpod
Future<FlathubAppstream> appstream(Ref ref, String appId) async {
  final client = ref.read(flathubClientProvider);
  return client.appstream(appId);
}

@riverpod
Future<FlathubSummary> summary(Ref ref, String appId) async {
  final client = ref.read(flathubClientProvider);
  return client.summary(appId);
}

@riverpod
Future<FlathubPagination> developer(Ref ref, String developerName,
    {int page = 1, int pageSize = 50}) async {
  final client = ref.read(flathubClientProvider);
  return client.developer(developerName, page, pageSize);
}

@riverpod
Future<List<FlathubAppstream>> appsOfTheWeek(Ref ref) async {
  final client = ref.read(flathubClientProvider);
  final dateString = DateTime.now().toYYYYMMDD();
  final apps = await client.appsOfTheWeek(dateString);
  final ids = apps.apps.map((e) => e.appId).toList();
  return Future.wait(ids.map((id) => ref.watch(appstreamProvider(id).future)));
}

@riverpod
Future<RecommendedApp> circleAppOfTheDay(Ref ref) async {
  final dio = ref.read(dioProvider);
  final res = await dio
      .get<Map<String, dynamic>>('https://apps.gnome.org/_api/apps.json');

  final appIds = res.data!.entries
      .toList()
      .where((f) => f.value["on_flathub"] == true)
      .where((f) => f.value["gnome"] == "circle")
      .map((e) => e.key)
      .toList();

  final seed = DateTime.now().dayOfYear;
  final random = Random(seed + 1);
  final appId = appIds[random.nextInt(appIds.length)];

  return RecommendedApp(
    name: res.data![appId]["name"],
    id: appId,
    icon: "https://apps.gnome.org/icons/scalable/$appId.svg",
    summary: res.data![appId]["summary"],
    branding: [
      FlathubAppstreamBranding(
        value: res.data![appId]["brand_color_dark"],
        type: "branding",
        schemePreference: FlathubAppstreamBrandingSchema.dark,
      ),
      FlathubAppstreamBranding(
        value: res.data![appId]["brand_color_light"],
        type: "branding",
        schemePreference: FlathubAppstreamBrandingSchema.light,
      ),
    ],
  );
}

@riverpod
Future<FlathubAppstream> appOfTheDay(Ref ref) async {
  final flathub = ref.read(flathubClientProvider);
  final data = await flathub.appOfTheDay(DateTime.now().toYYYYMMDD());
  return ref.watch(appstreamProvider(data.appId).future);
}

@riverpod
Future<FlathubPagination> trendingApps(Ref ref,
    {int page = 1, int pageSize = 50}) async {
  final client = ref.read(flathubClientProvider);
  return client.trendingLastTwoWeek(page, pageSize);
}

@riverpod
Future<FlathubPagination> popularApps(Ref ref,
    {int page = 1, int pageSize = 50}) async {
  final client = ref.read(flathubClientProvider);
  return client.popularLastMonth(page, pageSize);
}

@riverpod
Future<FlathubPagination> newApps(Ref ref,
    {int page = 1, int pageSize = 50}) async {
  final client = ref.read(flathubClientProvider);
  return client.recentlyAdded(page, pageSize);
}

@riverpod
Future<FlathubPagination> updatedApps(Ref ref,
    {int page = 1, int pageSize = 50}) async {
  final client = ref.read(flathubClientProvider);
  return client.recentlyUpdated(page, pageSize);
}

@riverpod
Future<FlathubPagination> search(
  Ref ref,
  String query, {
  int page = 1,
  int pageSize = 50,
}) async {
  final client = ref.read(flathubClientProvider);
  return client.search(FlathubSearchOptions(query: query), page, pageSize);
}
