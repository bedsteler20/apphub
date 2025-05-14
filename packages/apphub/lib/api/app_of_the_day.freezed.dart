// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_of_the_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlathubAppOfTheDay _$FlathubAppOfTheDayFromJson(Map<String, dynamic> json) {
  return _FlathubAppOfTheDay.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppOfTheDay {
  String get appId => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppOfTheDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppOfTheDayCopyWith<FlathubAppOfTheDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppOfTheDayCopyWith<$Res> {
  factory $FlathubAppOfTheDayCopyWith(
          FlathubAppOfTheDay value, $Res Function(FlathubAppOfTheDay) then) =
      _$FlathubAppOfTheDayCopyWithImpl<$Res, FlathubAppOfTheDay>;
  @useResult
  $Res call({String appId, String day});
}

/// @nodoc
class _$FlathubAppOfTheDayCopyWithImpl<$Res, $Val extends FlathubAppOfTheDay>
    implements $FlathubAppOfTheDayCopyWith<$Res> {
  _$FlathubAppOfTheDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppOfTheDayImplCopyWith<$Res>
    implements $FlathubAppOfTheDayCopyWith<$Res> {
  factory _$$FlathubAppOfTheDayImplCopyWith(_$FlathubAppOfTheDayImpl value,
          $Res Function(_$FlathubAppOfTheDayImpl) then) =
      __$$FlathubAppOfTheDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appId, String day});
}

/// @nodoc
class __$$FlathubAppOfTheDayImplCopyWithImpl<$Res>
    extends _$FlathubAppOfTheDayCopyWithImpl<$Res, _$FlathubAppOfTheDayImpl>
    implements _$$FlathubAppOfTheDayImplCopyWith<$Res> {
  __$$FlathubAppOfTheDayImplCopyWithImpl(_$FlathubAppOfTheDayImpl _value,
      $Res Function(_$FlathubAppOfTheDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? day = null,
  }) {
    return _then(_$FlathubAppOfTheDayImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppOfTheDayImpl implements _FlathubAppOfTheDay {
  _$FlathubAppOfTheDayImpl({required this.appId, required this.day});

  factory _$FlathubAppOfTheDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppOfTheDayImplFromJson(json);

  @override
  final String appId;
  @override
  final String day;

  @override
  String toString() {
    return 'FlathubAppOfTheDay(appId: $appId, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppOfTheDayImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appId, day);

  /// Create a copy of FlathubAppOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppOfTheDayImplCopyWith<_$FlathubAppOfTheDayImpl> get copyWith =>
      __$$FlathubAppOfTheDayImplCopyWithImpl<_$FlathubAppOfTheDayImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppOfTheDayImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppOfTheDay implements FlathubAppOfTheDay {
  factory _FlathubAppOfTheDay(
      {required final String appId,
      required final String day}) = _$FlathubAppOfTheDayImpl;

  factory _FlathubAppOfTheDay.fromJson(Map<String, dynamic> json) =
      _$FlathubAppOfTheDayImpl.fromJson;

  @override
  String get appId;
  @override
  String get day;

  /// Create a copy of FlathubAppOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppOfTheDayImplCopyWith<_$FlathubAppOfTheDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlathubAppsOfTheWeek _$FlathubAppsOfTheWeekFromJson(Map<String, dynamic> json) {
  return _FlathubAppsOfTheWeek.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppsOfTheWeek {
  List<FlathubAppOfTheWeek> get apps => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppsOfTheWeek to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppsOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppsOfTheWeekCopyWith<FlathubAppsOfTheWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppsOfTheWeekCopyWith<$Res> {
  factory $FlathubAppsOfTheWeekCopyWith(FlathubAppsOfTheWeek value,
          $Res Function(FlathubAppsOfTheWeek) then) =
      _$FlathubAppsOfTheWeekCopyWithImpl<$Res, FlathubAppsOfTheWeek>;
  @useResult
  $Res call({List<FlathubAppOfTheWeek> apps});
}

/// @nodoc
class _$FlathubAppsOfTheWeekCopyWithImpl<$Res,
        $Val extends FlathubAppsOfTheWeek>
    implements $FlathubAppsOfTheWeekCopyWith<$Res> {
  _$FlathubAppsOfTheWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppsOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apps = null,
  }) {
    return _then(_value.copyWith(
      apps: null == apps
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppOfTheWeek>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppsOfTheWeekImplCopyWith<$Res>
    implements $FlathubAppsOfTheWeekCopyWith<$Res> {
  factory _$$FlathubAppsOfTheWeekImplCopyWith(_$FlathubAppsOfTheWeekImpl value,
          $Res Function(_$FlathubAppsOfTheWeekImpl) then) =
      __$$FlathubAppsOfTheWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FlathubAppOfTheWeek> apps});
}

/// @nodoc
class __$$FlathubAppsOfTheWeekImplCopyWithImpl<$Res>
    extends _$FlathubAppsOfTheWeekCopyWithImpl<$Res, _$FlathubAppsOfTheWeekImpl>
    implements _$$FlathubAppsOfTheWeekImplCopyWith<$Res> {
  __$$FlathubAppsOfTheWeekImplCopyWithImpl(_$FlathubAppsOfTheWeekImpl _value,
      $Res Function(_$FlathubAppsOfTheWeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppsOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apps = null,
  }) {
    return _then(_$FlathubAppsOfTheWeekImpl(
      apps: null == apps
          ? _value._apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppOfTheWeek>,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppsOfTheWeekImpl implements _FlathubAppsOfTheWeek {
  _$FlathubAppsOfTheWeekImpl({required final List<FlathubAppOfTheWeek> apps})
      : _apps = apps;

  factory _$FlathubAppsOfTheWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppsOfTheWeekImplFromJson(json);

  final List<FlathubAppOfTheWeek> _apps;
  @override
  List<FlathubAppOfTheWeek> get apps {
    if (_apps is EqualUnmodifiableListView) return _apps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apps);
  }

  @override
  String toString() {
    return 'FlathubAppsOfTheWeek(apps: $apps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppsOfTheWeekImpl &&
            const DeepCollectionEquality().equals(other._apps, _apps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_apps));

  /// Create a copy of FlathubAppsOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppsOfTheWeekImplCopyWith<_$FlathubAppsOfTheWeekImpl>
      get copyWith =>
          __$$FlathubAppsOfTheWeekImplCopyWithImpl<_$FlathubAppsOfTheWeekImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppsOfTheWeekImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppsOfTheWeek implements FlathubAppsOfTheWeek {
  factory _FlathubAppsOfTheWeek(
          {required final List<FlathubAppOfTheWeek> apps}) =
      _$FlathubAppsOfTheWeekImpl;

  factory _FlathubAppsOfTheWeek.fromJson(Map<String, dynamic> json) =
      _$FlathubAppsOfTheWeekImpl.fromJson;

  @override
  List<FlathubAppOfTheWeek> get apps;

  /// Create a copy of FlathubAppsOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppsOfTheWeekImplCopyWith<_$FlathubAppsOfTheWeekImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppOfTheWeek _$FlathubAppOfTheWeekFromJson(Map<String, dynamic> json) {
  return _FlathubAppOfTheWeek.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppOfTheWeek {
  String get appId => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppOfTheWeek to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppOfTheWeekCopyWith<FlathubAppOfTheWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppOfTheWeekCopyWith<$Res> {
  factory $FlathubAppOfTheWeekCopyWith(
          FlathubAppOfTheWeek value, $Res Function(FlathubAppOfTheWeek) then) =
      _$FlathubAppOfTheWeekCopyWithImpl<$Res, FlathubAppOfTheWeek>;
  @useResult
  $Res call({String appId, int position});
}

/// @nodoc
class _$FlathubAppOfTheWeekCopyWithImpl<$Res, $Val extends FlathubAppOfTheWeek>
    implements $FlathubAppOfTheWeekCopyWith<$Res> {
  _$FlathubAppOfTheWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppOfTheWeekImplCopyWith<$Res>
    implements $FlathubAppOfTheWeekCopyWith<$Res> {
  factory _$$FlathubAppOfTheWeekImplCopyWith(_$FlathubAppOfTheWeekImpl value,
          $Res Function(_$FlathubAppOfTheWeekImpl) then) =
      __$$FlathubAppOfTheWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appId, int position});
}

/// @nodoc
class __$$FlathubAppOfTheWeekImplCopyWithImpl<$Res>
    extends _$FlathubAppOfTheWeekCopyWithImpl<$Res, _$FlathubAppOfTheWeekImpl>
    implements _$$FlathubAppOfTheWeekImplCopyWith<$Res> {
  __$$FlathubAppOfTheWeekImplCopyWithImpl(_$FlathubAppOfTheWeekImpl _value,
      $Res Function(_$FlathubAppOfTheWeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? position = null,
  }) {
    return _then(_$FlathubAppOfTheWeekImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppOfTheWeekImpl implements _FlathubAppOfTheWeek {
  _$FlathubAppOfTheWeekImpl({required this.appId, required this.position});

  factory _$FlathubAppOfTheWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppOfTheWeekImplFromJson(json);

  @override
  final String appId;
  @override
  final int position;

  @override
  String toString() {
    return 'FlathubAppOfTheWeek(appId: $appId, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppOfTheWeekImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appId, position);

  /// Create a copy of FlathubAppOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppOfTheWeekImplCopyWith<_$FlathubAppOfTheWeekImpl> get copyWith =>
      __$$FlathubAppOfTheWeekImplCopyWithImpl<_$FlathubAppOfTheWeekImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppOfTheWeekImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppOfTheWeek implements FlathubAppOfTheWeek {
  factory _FlathubAppOfTheWeek(
      {required final String appId,
      required final int position}) = _$FlathubAppOfTheWeekImpl;

  factory _FlathubAppOfTheWeek.fromJson(Map<String, dynamic> json) =
      _$FlathubAppOfTheWeekImpl.fromJson;

  @override
  String get appId;
  @override
  int get position;

  /// Create a copy of FlathubAppOfTheWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppOfTheWeekImplCopyWith<_$FlathubAppOfTheWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendedApp _$RecommendedAppFromJson(Map<String, dynamic> json) {
  return _RecommendedApp.fromJson(json);
}

/// @nodoc
mixin _$RecommendedApp {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  List<FlathubAppstreamBranding> get branding =>
      throw _privateConstructorUsedError;

  /// Serializes this RecommendedApp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendedApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendedAppCopyWith<RecommendedApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedAppCopyWith<$Res> {
  factory $RecommendedAppCopyWith(
          RecommendedApp value, $Res Function(RecommendedApp) then) =
      _$RecommendedAppCopyWithImpl<$Res, RecommendedApp>;
  @useResult
  $Res call(
      {String name,
      String id,
      String icon,
      String? summary,
      List<FlathubAppstreamBranding> branding});
}

/// @nodoc
class _$RecommendedAppCopyWithImpl<$Res, $Val extends RecommendedApp>
    implements $RecommendedAppCopyWith<$Res> {
  _$RecommendedAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendedApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? icon = null,
    Object? summary = freezed,
    Object? branding = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      branding: null == branding
          ? _value.branding
          : branding // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamBranding>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendedAppImplCopyWith<$Res>
    implements $RecommendedAppCopyWith<$Res> {
  factory _$$RecommendedAppImplCopyWith(_$RecommendedAppImpl value,
          $Res Function(_$RecommendedAppImpl) then) =
      __$$RecommendedAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String id,
      String icon,
      String? summary,
      List<FlathubAppstreamBranding> branding});
}

/// @nodoc
class __$$RecommendedAppImplCopyWithImpl<$Res>
    extends _$RecommendedAppCopyWithImpl<$Res, _$RecommendedAppImpl>
    implements _$$RecommendedAppImplCopyWith<$Res> {
  __$$RecommendedAppImplCopyWithImpl(
      _$RecommendedAppImpl _value, $Res Function(_$RecommendedAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecommendedApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? icon = null,
    Object? summary = freezed,
    Object? branding = null,
  }) {
    return _then(_$RecommendedAppImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      branding: null == branding
          ? _value._branding
          : branding // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamBranding>,
    ));
  }
}

/// @nodoc

@snakeCase
class _$RecommendedAppImpl implements _RecommendedApp {
  _$RecommendedAppImpl(
      {required this.name,
      required this.id,
      required this.icon,
      required this.summary,
      required final List<FlathubAppstreamBranding> branding})
      : _branding = branding;

  factory _$RecommendedAppImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendedAppImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String icon;
  @override
  final String? summary;
  final List<FlathubAppstreamBranding> _branding;
  @override
  List<FlathubAppstreamBranding> get branding {
    if (_branding is EqualUnmodifiableListView) return _branding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branding);
  }

  @override
  String toString() {
    return 'RecommendedApp(name: $name, id: $id, icon: $icon, summary: $summary, branding: $branding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedAppImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._branding, _branding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, icon, summary,
      const DeepCollectionEquality().hash(_branding));

  /// Create a copy of RecommendedApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedAppImplCopyWith<_$RecommendedAppImpl> get copyWith =>
      __$$RecommendedAppImplCopyWithImpl<_$RecommendedAppImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedAppImplToJson(
      this,
    );
  }
}

abstract class _RecommendedApp implements RecommendedApp {
  factory _RecommendedApp(
          {required final String name,
          required final String id,
          required final String icon,
          required final String? summary,
          required final List<FlathubAppstreamBranding> branding}) =
      _$RecommendedAppImpl;

  factory _RecommendedApp.fromJson(Map<String, dynamic> json) =
      _$RecommendedAppImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get icon;
  @override
  String? get summary;
  @override
  List<FlathubAppstreamBranding> get branding;

  /// Create a copy of RecommendedApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendedAppImplCopyWith<_$RecommendedAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
