// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlathubAppstreamIconImpl _$$FlathubAppstreamIconImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamIconImpl(
      url: json['url'] as String,
      height: json['height'] == null
          ? 0
          : strToInt.fromJson(json['height'] as String),
      width: json['width'] == null
          ? 0
          : strToInt.fromJson(json['width'] as String),
      scale: json['scale'] == null
          ? 0
          : strToInt.fromJson(json['scale'] as String),
    );

Map<String, dynamic> _$$FlathubAppstreamIconImplToJson(
        _$FlathubAppstreamIconImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'height': strToInt.toJson(instance.height),
      'width': strToInt.toJson(instance.width),
      'scale': strToInt.toJson(instance.scale),
    };

_$FlathubAppstreamBrandingImpl _$$FlathubAppstreamBrandingImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamBrandingImpl(
      value: json['value'] as String,
      type: json['type'] as String,
      schemePreference: $enumDecodeNullable(
              _$FlathubAppstreamBrandingSchemaEnumMap,
              json['scheme_preference'],
              unknownValue: FlathubAppstreamBrandingSchema.light) ??
          FlathubAppstreamBrandingSchema.light,
    );

Map<String, dynamic> _$$FlathubAppstreamBrandingImplToJson(
        _$FlathubAppstreamBrandingImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
      'scheme_preference':
          _$FlathubAppstreamBrandingSchemaEnumMap[instance.schemePreference]!,
    };

const _$FlathubAppstreamBrandingSchemaEnumMap = {
  FlathubAppstreamBrandingSchema.light: 'light',
  FlathubAppstreamBrandingSchema.dark: 'dark',
};

_$FlathubAppstreamUrlsImpl _$$FlathubAppstreamUrlsImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamUrlsImpl(
      bugtracker: json['bugtracker'] as String?,
      donation: json['donation'] as String?,
      homepage: json['homepage'] as String?,
      translate: json['translate'] as String?,
      help: json['help'] as String?,
      faq: json['faq'] as String?,
      contact: json['contact'] as String?,
      vcsBrowser: json['vcs_browser'] as String?,
      contribute: json['contribute'] as String?,
    );

Map<String, dynamic> _$$FlathubAppstreamUrlsImplToJson(
        _$FlathubAppstreamUrlsImpl instance) =>
    <String, dynamic>{
      'bugtracker': instance.bugtracker,
      'donation': instance.donation,
      'homepage': instance.homepage,
      'translate': instance.translate,
      'help': instance.help,
      'faq': instance.faq,
      'contact': instance.contact,
      'vcs_browser': instance.vcsBrowser,
      'contribute': instance.contribute,
    };

_$FlathubAppstreamScreenShotImpl _$$FlathubAppstreamScreenShotImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamScreenShotImpl(
      caption: json['caption'] as String?,
      sizes: (json['sizes'] as List<dynamic>?)
              ?.map((e) => FlathubAppstreamScreenShotSize.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$FlathubAppstreamScreenShotImplToJson(
        _$FlathubAppstreamScreenShotImpl instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'sizes': instance.sizes,
    };

_$FlathubAppstreamScreenShotSizeImpl
    _$$FlathubAppstreamScreenShotSizeImplFromJson(Map<String, dynamic> json) =>
        _$FlathubAppstreamScreenShotSizeImpl(
          width: strToInt.fromJson(json['width'] as String),
          height: strToInt.fromJson(json['height'] as String),
          src: json['src'] as String,
          caption: json['caption'] as String?,
          scale: json['scale'] as String?,
        );

Map<String, dynamic> _$$FlathubAppstreamScreenShotSizeImplToJson(
        _$FlathubAppstreamScreenShotSizeImpl instance) =>
    <String, dynamic>{
      'width': strToInt.toJson(instance.width),
      'height': strToInt.toJson(instance.height),
      'src': instance.src,
      'caption': instance.caption,
      'scale': instance.scale,
    };

_$FlathubAppstreamReleaseImpl _$$FlathubAppstreamReleaseImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamReleaseImpl(
      version: json['version'] as String,
      url: json['url'] as String?,
      description: json['description'] as String?,
      timestamp: json['timestamp'] as String?,
      type: $enumDecodeNullable(
          _$FlathubAppstreamReleaseTypeEnumMap, json['type']),
      urgency: $enumDecodeNullable(
          _$FlathubAppstreamReleaseUrgencyEnumMap, json['urgency']),
    );

Map<String, dynamic> _$$FlathubAppstreamReleaseImplToJson(
        _$FlathubAppstreamReleaseImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'url': instance.url,
      'description': instance.description,
      'timestamp': instance.timestamp,
      'type': _$FlathubAppstreamReleaseTypeEnumMap[instance.type],
      'urgency': _$FlathubAppstreamReleaseUrgencyEnumMap[instance.urgency],
    };

const _$FlathubAppstreamReleaseTypeEnumMap = {
  FlathubAppstreamReleaseType.stable: 'stable',
  FlathubAppstreamReleaseType.development: 'development',
};

const _$FlathubAppstreamReleaseUrgencyEnumMap = {
  FlathubAppstreamReleaseUrgency.low: 'low',
  FlathubAppstreamReleaseUrgency.medium: 'medium',
  FlathubAppstreamReleaseUrgency.high: 'high',
  FlathubAppstreamReleaseUrgency.critical: 'critical',
};

_$FlathubAppstreamLaunchableImpl _$$FlathubAppstreamLaunchableImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamLaunchableImpl(
      value: json['value'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$FlathubAppstreamLaunchableImplToJson(
        _$FlathubAppstreamLaunchableImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
    };

_$FlathubAppstreamBundleImpl _$$FlathubAppstreamBundleImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamBundleImpl(
      value: json['value'] as String,
      type: json['type'] as String,
      runtime: json['runtime'] as String,
      sdk: json['sdk'] as String,
    );

Map<String, dynamic> _$$FlathubAppstreamBundleImplToJson(
        _$FlathubAppstreamBundleImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
      'runtime': instance.runtime,
      'sdk': instance.sdk,
    };

_$FlathubAppstreamMetadataImpl _$$FlathubAppstreamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamMetadataImpl(
      manifest: json['flathub::manifest'] as String?,
      verified: json['flathub::verification::verified'] as String?,
      verificationMethod: json['flathub::verification::method'] as String?,
      verificationLoginName:
          json['flathub::verification::login_name'] as String?,
      verificationLoginProvider:
          json['flathub::verification::login_provider'] as String?,
      verificationLoginWebsite:
          json['flathub::verification::website'] as String?,
      verificationTimestamp:
          json['flathub::verification::timestamp'] as String?,
      verificationLoginIsOrganization:
          json['flathub::verification::login_is_organization'] as String?,
    );

Map<String, dynamic> _$$FlathubAppstreamMetadataImplToJson(
        _$FlathubAppstreamMetadataImpl instance) =>
    <String, dynamic>{
      'flathub::manifest': instance.manifest,
      'flathub::verification::verified': instance.verified,
      'flathub::verification::method': instance.verificationMethod,
      'flathub::verification::login_name': instance.verificationLoginName,
      'flathub::verification::login_provider':
          instance.verificationLoginProvider,
      'flathub::verification::website': instance.verificationLoginWebsite,
      'flathub::verification::timestamp': instance.verificationTimestamp,
      'flathub::verification::login_is_organization':
          instance.verificationLoginIsOrganization,
    };

_$FlathubAppstreamDesktopImpl _$$FlathubAppstreamDesktopImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamDesktopImpl(
      summary: json['summary'] as String?,
      description: json['description'] as String?,
      screenshots: (json['screenshots'] as List<dynamic>?)
              ?.map((e) => FlathubAppstreamScreenShot.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      releases: (json['releases'] as List<dynamic>?)
              ?.map((e) =>
                  FlathubAppstreamRelease.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      urls: json['urls'] == null
          ? null
          : FlathubAppstreamUrls.fromJson(json['urls'] as Map<String, dynamic>),
      icons: (json['icons'] as List<dynamic>?)
              ?.map((e) =>
                  FlathubAppstreamIcon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      developerName: json['developer_name'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      kudos:
          (json['kudos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      mimetypes: (json['mimetypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      projectLicense: json['project_license'] as String?,
      launchable: FlathubAppstreamLaunchable.fromJson(
          json['launchable'] as Map<String, dynamic>),
      bundle: FlathubAppstreamBundle.fromJson(
          json['bundle'] as Map<String, dynamic>),
      metadata: json['metadata'] == null
          ? null
          : FlathubAppstreamMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      isFreeLicense: json['is_free_license'] as bool? ?? false,
      branding: (json['branding'] as List<dynamic>?)
              ?.map((e) =>
                  FlathubAppstreamBranding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      projectGroup: json['project_group'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FlathubAppstreamDesktopImplToJson(
        _$FlathubAppstreamDesktopImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'description': instance.description,
      'screenshots': instance.screenshots,
      'releases': instance.releases,
      'urls': instance.urls,
      'icons': instance.icons,
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'developer_name': instance.developerName,
      'categories': instance.categories,
      'kudos': instance.kudos,
      'mimetypes': instance.mimetypes,
      'project_license': instance.projectLicense,
      'launchable': instance.launchable,
      'bundle': instance.bundle,
      'metadata': instance.metadata,
      'keywords': instance.keywords,
      'is_free_license': instance.isFreeLicense,
      'branding': instance.branding,
      'project_group': instance.projectGroup,
      'type': instance.$type,
    };

_$FlathubAppstreamAddonImpl _$$FlathubAppstreamAddonImplFromJson(
        Map<String, dynamic> json) =>
    _$FlathubAppstreamAddonImpl(
      releases: (json['releases'] as List<dynamic>?)
              ?.map((e) =>
                  FlathubAppstreamRelease.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      urls: json['urls'] == null
          ? null
          : FlathubAppstreamUrls.fromJson(json['urls'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      icons: (json['icons'] as List<dynamic>?)
              ?.map((e) =>
                  FlathubAppstreamIcon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String,
      name: json['name'] as String?,
      developerName: json['developer_name'] as String?,
      summary: json['summary'] as String?,
      projectLicense: json['project_license'] as String?,
      extendsApp: json['extends'] as String,
      bundle: FlathubAppstreamBundle.fromJson(
          json['bundle'] as Map<String, dynamic>),
      metadata: json['metadata'] == null
          ? null
          : FlathubAppstreamMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      isFreeLicense: json['is_free_license'] as bool? ?? false,
      projectGroup: json['project_group'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FlathubAppstreamAddonImplToJson(
        _$FlathubAppstreamAddonImpl instance) =>
    <String, dynamic>{
      'releases': instance.releases,
      'urls': instance.urls,
      'icon': instance.icon,
      'icons': instance.icons,
      'id': instance.id,
      'name': instance.name,
      'developer_name': instance.developerName,
      'summary': instance.summary,
      'project_license': instance.projectLicense,
      'extends': instance.extendsApp,
      'bundle': instance.bundle,
      'metadata': instance.metadata,
      'is_free_license': instance.isFreeLicense,
      'project_group': instance.projectGroup,
      'type': instance.$type,
    };
