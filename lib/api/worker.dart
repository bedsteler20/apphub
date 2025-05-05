import 'package:freezed_annotation/freezed_annotation.dart';
import 'utils.dart';

part 'worker.freezed.dart';
part 'worker.g.dart';

@freezed
class InstalledApp with _$InstalledApp {
  @kebabCase
  const factory InstalledApp({
    required String appId,
    required String? name,
    required String? summary,
    
  }) = _InstalledApp;

  factory InstalledApp.fromJson(Map<String, dynamic> json) =>
      _$InstalledAppFromJson(json);
}
