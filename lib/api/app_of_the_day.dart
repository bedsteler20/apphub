import 'package:deckhub/api/appstream.dart';
import 'package:deckhub/api/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_of_the_day.freezed.dart';
part 'app_of_the_day.g.dart';

@freezed
class FlathubAppOfTheDay with _$FlathubAppOfTheDay {
  @snakeCase
  factory FlathubAppOfTheDay({
    required String appId,
    required String day,
  }) = _FlathubAppOfTheDay;

  factory FlathubAppOfTheDay.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppOfTheDayFromJson(json);
}

@freezed
class FlathubAppsOfTheWeek with _$FlathubAppsOfTheWeek {
  @snakeCase
  factory FlathubAppsOfTheWeek({
    required List<FlathubAppOfTheWeek> apps,
  }) = _FlathubAppsOfTheWeek;

  factory FlathubAppsOfTheWeek.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppsOfTheWeekFromJson(json);
}

@freezed
class FlathubAppOfTheWeek with _$FlathubAppOfTheWeek {
  @snakeCase
  factory FlathubAppOfTheWeek({
    required String appId,
    required int position,
  }) = _FlathubAppOfTheWeek;

  factory FlathubAppOfTheWeek.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppOfTheWeekFromJson(json);
}

@freezed
class RecommendedApp with _$RecommendedApp {
  @snakeCase
  factory RecommendedApp({
    required String name,
    required String id,
    required String icon,
    required String? summary,
    required List<FlathubAppstreamBranding> branding,
  }) = _RecommendedApp;

  factory RecommendedApp.fromJson(Map<String, dynamic> json) =>
      _$RecommendedAppFromJson(json);
}
