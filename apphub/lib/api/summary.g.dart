// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlathubSummarySessionBusImpl _$$FlathubSummarySessionBusImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubSummarySessionBusImpl(
      talk:
          (json['talk'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      own: (json['own'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
    );

Map<String, dynamic> _$$FlathubSummarySessionBusImplToJson(
        _$FlathubSummarySessionBusImpl instance) =>
    <String, dynamic>{
      'talk': instance.talk,
      'own': instance.own,
    };

_$FlathubSummeryPermissionsImpl _$$FlathubSummeryPermissionsImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubSummeryPermissionsImpl(
      shared: (json['shared'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      sockets: (json['sockets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      devices: (json['devices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      filesystems: (json['filesystems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      sessionBus: json['session-bus'] == null
          ? null
          : FlathubSummarySessionBus.fromJson(
              json['session-bus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FlathubSummeryPermissionsImplToJson(
        _$FlathubSummeryPermissionsImpl instance) =>
    <String, dynamic>{
      'shared': instance.shared,
      'sockets': instance.sockets,
      'devices': instance.devices,
      'filesystems': instance.filesystems,
      'session-bus': instance.sessionBus,
    };

_$FlathubSummeryExtensionImpl _$$FlathubSummeryExtensionImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubSummeryExtensionImpl(
      directory: json['directory'] as String?,
      autodelete: _$JsonConverterFromJson<String, bool>(
          json['autodelete'], strToBool.fromJson),
      noAutoDownload: _$JsonConverterFromJson<String, bool>(
          json['no-auto-download'], strToBool.fromJson),
      version: json['version'] as String?,
      addLdPath: json['add-ld-path'] as String?,
      mergeDirs: json['merge-dirs'] as String?,
      subdirectories: _$JsonConverterFromJson<String, bool>(
          json['subdirectories'], strToBool.fromJson),
      localeSubset: _$JsonConverterFromJson<String, bool>(
          json['locale-subset'], strToBool.fromJson),
    );

Map<String, dynamic> _$$FlathubSummeryExtensionImplToJson(
        _$FlathubSummeryExtensionImpl instance) =>
    <String, dynamic>{
      'directory': instance.directory,
      'autodelete': _$JsonConverterToJson<String, bool>(
          instance.autodelete, strToBool.toJson),
      'no-auto-download': _$JsonConverterToJson<String, bool>(
          instance.noAutoDownload, strToBool.toJson),
      'version': instance.version,
      'add-ld-path': instance.addLdPath,
      'merge-dirs': instance.mergeDirs,
      'subdirectories': _$JsonConverterToJson<String, bool>(
          instance.subdirectories, strToBool.toJson),
      'locale-subset': _$JsonConverterToJson<String, bool>(
          instance.localeSubset, strToBool.toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$FlathubSummeryExtraDataImpl _$$FlathubSummeryExtraDataImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubSummeryExtraDataImpl(
      name: json['name'] as String?,
      checksum: json['checksum'] as String?,
      size: json['size'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$$FlathubSummeryExtraDataImplToJson(
        _$FlathubSummeryExtraDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'checksum': instance.checksum,
      'size': instance.size,
      'uri': instance.uri,
    };

_$FlathubSummeryMetadataImpl _$$FlathubSummeryMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubSummeryMetadataImpl(
      name: json['name'] as String,
      sdk: json['sdk'] as String,
      runtime: json['runtime'] as String,
      permissions: FlathubSummeryPermissions.fromJson(
          json['permissions'] as Map<String, dynamic>),
      requiredFlatpak: json['required-flatpak'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      extensions: (json['extensions'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, FlathubSummeryExtension.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
      builtExtensions: (json['built-extensions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      runtimeIsEol: json['runtime-is-eol'] as bool? ?? false,
      extraData: json['extra-data'] == null
          ? null
          : FlathubSummeryExtraData.fromJson(
              json['extra-data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FlathubSummeryMetadataImplToJson(
        _$FlathubSummeryMetadataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sdk': instance.sdk,
      'runtime': instance.runtime,
      'permissions': instance.permissions,
      'required-flatpak': instance.requiredFlatpak,
      'tags': instance.tags,
      'extensions': instance.extensions,
      'built-extensions': instance.builtExtensions,
      'runtime-is-eol': instance.runtimeIsEol,
      'extra-data': instance.extraData,
    };

_$FlathubSummaryImpl _$$FlathubSummaryImplFromJson(Map<String, dynamic> json) =>
    _$FlathubSummaryImpl(
      arches: (json['arches'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
      downloadSize: (json['download_size'] as num?)?.toInt() ?? 0,
      installedSize: (json['installed_size'] as num?)?.toInt() ?? 0,
      branch: json['branch'] as String,
      metadata: json['metadata'] == null
          ? null
          : FlathubSummeryMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FlathubSummaryImplToJson(
        _$FlathubSummaryImpl instance) =>
    <String, dynamic>{
      'arches': instance.arches,
      'timestamp': instance.timestamp,
      'download_size': instance.downloadSize,
      'installed_size': instance.installedSize,
      'branch': instance.branch,
      'metadata': instance.metadata,
    };
