import 'package:deckhub/api/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class FlathubAppHit with _$FlathubAppHit {
  @snakeCase
  const factory FlathubAppHit({
    String? name,
    String? summary,
    @dInt required int installsLastMonth,
    @dDou required double trending,
    @dList required List<String> keywords,
    required String appId,
    String? description,
    String? icon,
    @dList required List<String> categories,
    String? developerName,
    String? verificationMethod,
    String? verificationLoginProvider,
    String? verificationWebsite,
    String? verificationTimestamp,
    String? verificationLoginName,
  }) = _FlathubAppHit;

  factory FlathubAppHit.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppHitFromJson(json);
}

@freezed
class FlathubPagination with _$FlathubPagination {
  const factory FlathubPagination({
    @dInt required int page,
    @dInt required int hitsPerPage,
    @dInt required int totalHits,
    @dInt required int totalPages,
    @dList required List<FlathubAppHit> hits,
  }) = _FlathubPagination;

  factory FlathubPagination.fromJson(Map<String, dynamic> json) =>
      _$FlathubPaginationFromJson(json);
}
