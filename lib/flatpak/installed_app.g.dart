// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installed_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstalledAppImpl _$$InstalledAppImplFromJson(Map<String, dynamic> json) =>
    _$InstalledAppImpl(
      name: json['name'] as String,
      arch: json['arch'] as String,
      branch: json['branch'] as String,
      commit: json['commit'] as String,
      collectionId: json['collectionId'] as String?,
      kind: $enumDecode(_$FlatpakRefKindEnumMap, json['kind']),
      appdataName: json['appdataName'] as String?,
      isCurrent: json['isCurrent'] as bool,
      installedSize: (json['installedSize'] as num).toInt(),
      deployDir: json['deployDir'] as String?,
      latestCommit: json['latestCommit'] as String?,
      origin: json['origin'] as String?,
      appdataLicense: json['appdataLicense'] as String?,
      appdataVersion: json['appdataVersion'] as String?,
      appdataSummary: json['appdataSummary'] as String?,
      eol: json['eol'] as String?,
      eolRebase: json['eolRebase'] as String?,
      isUser: json['isUser'] as bool,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$InstalledAppImplToJson(_$InstalledAppImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arch': instance.arch,
      'branch': instance.branch,
      'commit': instance.commit,
      'collectionId': instance.collectionId,
      'kind': _$FlatpakRefKindEnumMap[instance.kind]!,
      'appdataName': instance.appdataName,
      'isCurrent': instance.isCurrent,
      'installedSize': instance.installedSize,
      'deployDir': instance.deployDir,
      'latestCommit': instance.latestCommit,
      'origin': instance.origin,
      'appdataLicense': instance.appdataLicense,
      'appdataVersion': instance.appdataVersion,
      'appdataSummary': instance.appdataSummary,
      'eol': instance.eol,
      'eolRebase': instance.eolRebase,
      'isUser': instance.isUser,
      'icon': instance.icon,
    };

const _$FlatpakRefKindEnumMap = {
  FlatpakRefKind.app: 'app',
  FlatpakRefKind.runtime: 'runtime',
};
