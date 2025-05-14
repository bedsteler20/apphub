import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class FlathubSearchOptions with _$FlathubSearchOptions {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FlathubSearchOptions({
    required String query,
  }) = _FlathubSearchOptions;

  factory FlathubSearchOptions.fromJson(Map<String, dynamic> json) =>
      _$FlathubSearchOptionsFromJson(json);

  @override
  // ignore: unnecessary_overrides
  Map<String, dynamic> toJson() => super.toJson();
}
