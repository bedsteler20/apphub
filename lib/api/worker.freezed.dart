// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstalledApp _$InstalledAppFromJson(Map<String, dynamic> json) {
  return _InstalledApp.fromJson(json);
}

/// @nodoc
mixin _$InstalledApp {
  String get appId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;

  /// Serializes this InstalledApp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstalledApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstalledAppCopyWith<InstalledApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstalledAppCopyWith<$Res> {
  factory $InstalledAppCopyWith(
          InstalledApp value, $Res Function(InstalledApp) then) =
      _$InstalledAppCopyWithImpl<$Res, InstalledApp>;
  @useResult
  $Res call({String appId, String? name, String? summary});
}

/// @nodoc
class _$InstalledAppCopyWithImpl<$Res, $Val extends InstalledApp>
    implements $InstalledAppCopyWith<$Res> {
  _$InstalledAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstalledApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? name = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstalledAppImplCopyWith<$Res>
    implements $InstalledAppCopyWith<$Res> {
  factory _$$InstalledAppImplCopyWith(
          _$InstalledAppImpl value, $Res Function(_$InstalledAppImpl) then) =
      __$$InstalledAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appId, String? name, String? summary});
}

/// @nodoc
class __$$InstalledAppImplCopyWithImpl<$Res>
    extends _$InstalledAppCopyWithImpl<$Res, _$InstalledAppImpl>
    implements _$$InstalledAppImplCopyWith<$Res> {
  __$$InstalledAppImplCopyWithImpl(
      _$InstalledAppImpl _value, $Res Function(_$InstalledAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstalledApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? name = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$InstalledAppImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@kebabCase
class _$InstalledAppImpl implements _InstalledApp {
  const _$InstalledAppImpl(
      {required this.appId, required this.name, required this.summary});

  factory _$InstalledAppImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstalledAppImplFromJson(json);

  @override
  final String appId;
  @override
  final String? name;
  @override
  final String? summary;

  @override
  String toString() {
    return 'InstalledApp(appId: $appId, name: $name, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstalledAppImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appId, name, summary);

  /// Create a copy of InstalledApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstalledAppImplCopyWith<_$InstalledAppImpl> get copyWith =>
      __$$InstalledAppImplCopyWithImpl<_$InstalledAppImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstalledAppImplToJson(
      this,
    );
  }
}

abstract class _InstalledApp implements InstalledApp {
  const factory _InstalledApp(
      {required final String appId,
      required final String? name,
      required final String? summary}) = _$InstalledAppImpl;

  factory _InstalledApp.fromJson(Map<String, dynamic> json) =
      _$InstalledAppImpl.fromJson;

  @override
  String get appId;
  @override
  String? get name;
  @override
  String? get summary;

  /// Create a copy of InstalledApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstalledAppImplCopyWith<_$InstalledAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
