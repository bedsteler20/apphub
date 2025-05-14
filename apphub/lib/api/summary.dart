// ignore_for_file: invalid_annotation_target

import 'package:deckhub/api/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
class FlathubSummarySessionBus with _$FlathubSummarySessionBus {
  factory FlathubSummarySessionBus({
    @dList required List<String> talk,
    @dList required List<String> own,
  }) = _FlathubSummarySessionBus;

  factory FlathubSummarySessionBus.fromJson(Map<String, dynamic> json) =>
      _$FlathubSummarySessionBusFromJson(json);
}

@freezed
class FlathubSummeryPermissions with _$FlathubSummeryPermissions {
  @kebabCase
  factory FlathubSummeryPermissions({
    @dList required List<String> shared,
    @dList required List<String> sockets,
    @dList required List<String> devices,
    @dList required List<String> filesystems,
    FlathubSummarySessionBus? sessionBus,
  }) = _FlathubSummeryPermissions;

  factory FlathubSummeryPermissions.fromJson(Map<String, dynamic> json) =>
      _$FlathubSummeryPermissionsFromJson(json);
}

@freezed
class FlathubSummeryExtension with _$FlathubSummeryExtension {
  @kebabCase
  @strToBool
  factory FlathubSummeryExtension({
    String? directory,
    bool? autodelete,
    bool? noAutoDownload,
    String? version,
    String? addLdPath,
    String? mergeDirs,
    bool? subdirectories,
    bool? localeSubset,
  }) = _FlathubSummeryExtension;

  factory FlathubSummeryExtension.fromJson(Map<String, dynamic> json) =>
      _$FlathubSummeryExtensionFromJson(json);
}

@freezed
class FlathubSummeryExtraData with _$FlathubSummeryExtraData {
  factory FlathubSummeryExtraData({
    String? name,
    String? checksum,
    String? size,
    String? uri,
  }) = _FlathubSummeryExtraData;

  factory FlathubSummeryExtraData.fromJson(Map<String, dynamic> json) =>
      _$FlathubSummeryExtraDataFromJson(json);
}

@freezed
class FlathubSummeryMetadata with _$FlathubSummeryMetadata {
  @kebabCase
  factory FlathubSummeryMetadata({
    required String name,
    required String sdk,
    required String runtime,
    required FlathubSummeryPermissions permissions,
    String? requiredFlatpak,
    @dList required List<String> tags,
    @dMap required Map<String, FlathubSummeryExtension> extensions,
    @dList required List<String> builtExtensions,
    @dBool required bool runtimeIsEol,
    FlathubSummeryExtraData? extraData,
  }) = _FlathubSummeryMetadata;

  factory FlathubSummeryMetadata.fromJson(Map<String, dynamic> json) =>
      _$FlathubSummeryMetadataFromJson(json);
}

@freezed
class FlathubSummary with _$FlathubSummary {
  @snakeCase
  factory FlathubSummary({
    @dList required List<String> arches,
    @dInt required int timestamp,
    @dInt required int downloadSize,
    @dInt required int installedSize,
    required String branch,
    FlathubSummeryMetadata? metadata,
  }) = _FlathubSummary;

  factory FlathubSummary.fromJson(Map<String, dynamic> json) =>
      _$FlathubSummaryFromJson(json);
}
