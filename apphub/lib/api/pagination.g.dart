// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlathubAppHitImpl _$$FlathubAppHitImplFromJson(Map<String, dynamic> json) =>
    _$FlathubAppHitImpl(
      name: json['name'] as String?,
      summary: json['summary'] as String?,
      installsLastMonth: (json['installs_last_month'] as num?)?.toInt() ?? 0,
      trending: (json['trending'] as num?)?.toDouble() ?? 0.0,
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      appId: json['app_id'] as String,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      developerName: json['developer_name'] as String?,
      verificationMethod: json['verification_method'] as String?,
      verificationLoginProvider: json['verification_login_provider'] as String?,
      verificationWebsite: json['verification_website'] as String?,
      verificationTimestamp: json['verification_timestamp'] as String?,
      verificationLoginName: json['verification_login_name'] as String?,
    );

Map<String, dynamic> _$$FlathubAppHitImplToJson(_$FlathubAppHitImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'summary': instance.summary,
      'installs_last_month': instance.installsLastMonth,
      'trending': instance.trending,
      'keywords': instance.keywords,
      'app_id': instance.appId,
      'description': instance.description,
      'icon': instance.icon,
      'categories': instance.categories,
      'developer_name': instance.developerName,
      'verification_method': instance.verificationMethod,
      'verification_login_provider': instance.verificationLoginProvider,
      'verification_website': instance.verificationWebsite,
      'verification_timestamp': instance.verificationTimestamp,
      'verification_login_name': instance.verificationLoginName,
    };

_$FlathubPaginationImpl _$$FlathubPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubPaginationImpl(
      page: (json['page'] as num?)?.toInt() ?? 0,
      hitsPerPage: (json['hitsPerPage'] as num?)?.toInt() ?? 0,
      totalHits: (json['totalHits'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
      hits: (json['hits'] as List<dynamic>?)
              ?.map((e) => FlathubAppHit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$FlathubPaginationImplToJson(
        _$FlathubPaginationImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'hitsPerPage': instance.hitsPerPage,
      'totalHits': instance.totalHits,
      'totalPages': instance.totalPages,
      'hits': instance.hits,
    };
