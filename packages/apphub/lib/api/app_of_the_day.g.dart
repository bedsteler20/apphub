// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_of_the_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlathubAppOfTheDayImpl _$$FlathubAppOfTheDayImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppOfTheDayImpl(
      appId: json['app_id'] as String,
      day: json['day'] as String,
    );

Map<String, dynamic> _$$FlathubAppOfTheDayImplToJson(
        _$FlathubAppOfTheDayImpl instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'day': instance.day,
    };

_$FlathubAppsOfTheWeekImpl _$$FlathubAppsOfTheWeekImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppsOfTheWeekImpl(
      apps: (json['apps'] as List<dynamic>)
          .map((e) => FlathubAppOfTheWeek.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FlathubAppsOfTheWeekImplToJson(
        _$FlathubAppsOfTheWeekImpl instance) =>
    <String, dynamic>{
      'apps': instance.apps,
    };

_$FlathubAppOfTheWeekImpl _$$FlathubAppOfTheWeekImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppOfTheWeekImpl(
      appId: json['app_id'] as String,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$$FlathubAppOfTheWeekImplToJson(
        _$FlathubAppOfTheWeekImpl instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'position': instance.position,
    };

_$RecommendedAppImpl _$$RecommendedAppImplFromJson(Map<String, dynamic> json) =>
    _$RecommendedAppImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      icon: json['icon'] as String,
      summary: json['summary'] as String?,
      branding: (json['branding'] as List<dynamic>)
          .map((e) =>
              FlathubAppstreamBranding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecommendedAppImplToJson(
        _$RecommendedAppImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'icon': instance.icon,
      'summary': instance.summary,
      'branding': instance.branding,
    };
