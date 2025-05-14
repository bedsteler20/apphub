import 'package:deckhub/api/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appstream.freezed.dart';
part 'appstream.g.dart';

@freezed
class FlathubAppstreamIcon with _$FlathubAppstreamIcon {
  @strToInt
  factory FlathubAppstreamIcon({
    required String url,
    @dInt required int height,
    @dInt required int width,
    @dInt required int scale,
  }) = _FlathubAppstreamIcon;

  factory FlathubAppstreamIcon.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamIconFromJson(json);
}

enum FlathubAppstreamBrandingSchema {
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark,
}

@freezed
class FlathubAppstreamBranding with _$FlathubAppstreamBranding {
  @snakeCase
  factory FlathubAppstreamBranding({
    required String value,
    required String type,
    @JsonKey(
      unknownEnumValue: FlathubAppstreamBrandingSchema.light,
      defaultValue: FlathubAppstreamBrandingSchema.light,
    )
    required FlathubAppstreamBrandingSchema schemePreference,
  }) = _FlathubAppstreamBranding;

  factory FlathubAppstreamBranding.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamBrandingFromJson(json);
}

@freezed
class FlathubAppstreamUrls with _$FlathubAppstreamUrls {
  @snakeCase
  factory FlathubAppstreamUrls({
    String? bugtracker,
    String? donation,
    String? homepage,
    String? translate,
    String? help,
    String? faq,
    String? contact,
    String? vcsBrowser,
    String? contribute,
  }) = _FlathubAppstreamUrls;

  factory FlathubAppstreamUrls.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamUrlsFromJson(json);
}

@freezed
class FlathubAppstreamScreenShot with _$FlathubAppstreamScreenShot {
  factory FlathubAppstreamScreenShot({
    String? caption,
    @dList required List<FlathubAppstreamScreenShotSize> sizes,
  }) = _FlathubAppstreamScreenShot;

  factory FlathubAppstreamScreenShot.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamScreenShotFromJson(json);
}

@freezed
class FlathubAppstreamScreenShotSize with _$FlathubAppstreamScreenShotSize {
  @strToInt
  factory FlathubAppstreamScreenShotSize({
    required int width,
    required int height,
    required String src,
    String? caption,
    String? scale,
  }) = _FlathubAppstreamScreenShotSize;

  factory FlathubAppstreamScreenShotSize.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamScreenShotSizeFromJson(json);
}

enum FlathubAppstreamReleaseType {
  @JsonValue('stable')
  stable,
  @JsonValue('development')
  development,
}

enum FlathubAppstreamReleaseUrgency {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
}

@freezed
class FlathubAppstreamRelease with _$FlathubAppstreamRelease {
  factory FlathubAppstreamRelease({
    required String version,
    String? url,
    String? description,
    String? timestamp,
    FlathubAppstreamReleaseType? type,
    FlathubAppstreamReleaseUrgency? urgency,
  }) = _FlathubAppstreamRelease;

  factory FlathubAppstreamRelease.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamReleaseFromJson(json);
}

@freezed
class FlathubAppstreamLaunchable with _$FlathubAppstreamLaunchable {
  factory FlathubAppstreamLaunchable({
    required String value,
    required String type,
  }) = _FlathubAppstreamLaunchable;

  factory FlathubAppstreamLaunchable.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamLaunchableFromJson(json);
}

@freezed
class FlathubAppstreamBundle with _$FlathubAppstreamBundle {
  factory FlathubAppstreamBundle({
    required String value,
    required String type,
    required String runtime,
    required String sdk,
  }) = _FlathubAppstreamBundle;

  factory FlathubAppstreamBundle.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamBundleFromJson(json);
}

@freezed
class FlathubAppstreamMetadata with _$FlathubAppstreamMetadata {
  factory FlathubAppstreamMetadata({
    @JsonKey(name: "flathub::manifest") String? manifest,
    @JsonKey(name: "flathub::verification::verified") String? verified,
    @JsonKey(name: "flathub::verification::method") String? verificationMethod,
    @JsonKey(name: "flathub::verification::login_name")
    String? verificationLoginName,
    @JsonKey(name: "flathub::verification::login_provider")
    String? verificationLoginProvider,
    @JsonKey(name: "flathub::verification::website")
    String? verificationLoginWebsite,
    @JsonKey(name: "flathub::verification::timestamp")
    String? verificationTimestamp,
    @JsonKey(name: "flathub::verification::login_is_organization")
    String? verificationLoginIsOrganization,
  }) = _FlathubAppstreamMetadata;

  factory FlathubAppstreamMetadata.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamMetadataFromJson(json);
}

@Freezed(unionKey: 'type', fallbackUnion: 'desktop')
class FlathubAppstream with _$FlathubAppstream {
  @snakeCase
  factory FlathubAppstream.desktop({
    String? summary,
    String? description,
    @dList required List<FlathubAppstreamScreenShot> screenshots,
    @dList required List<FlathubAppstreamRelease> releases,
    FlathubAppstreamUrls? urls,
    @dList required List<FlathubAppstreamIcon> icons,
    required String id,
    required String name,
    String? icon,
    String? developerName,
    @dList required List<String> categories,
    @dList required List<String> kudos,
    @dList required List<String> mimetypes,
    String? projectLicense,
    required FlathubAppstreamLaunchable launchable,
    required FlathubAppstreamBundle bundle,
    FlathubAppstreamMetadata? metadata,
    @dList required List<String> keywords,
    @dBool required bool isFreeLicense,
    @dList required List<FlathubAppstreamBranding> branding,
    String? projectGroup,
  }) = FlathubAppstreamDesktop;

  @snakeCase
  factory FlathubAppstream.addon({
    @dList required List<FlathubAppstreamRelease> releases,
    FlathubAppstreamUrls? urls,
    String? icon,
    @dList required List<FlathubAppstreamIcon> icons,
    required String id,
    String? name,
    String? developerName,
    String? summary,
    String? projectLicense,
    @JsonKey(name: "extends") required String extendsApp,
    required FlathubAppstreamBundle bundle,
    FlathubAppstreamMetadata? metadata,
    @dBool required bool isFreeLicense,
    String? projectGroup,
  }) = FlathubAppstreamAddon;

  factory FlathubAppstream.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppstreamFromJson(json);
}
