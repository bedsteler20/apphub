// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appstream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlathubAppstreamIcon _$FlathubAppstreamIconFromJson(Map<String, dynamic> json) {
  return _FlathubAppstreamIcon.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamIcon {
  String get url => throw _privateConstructorUsedError;
  @dInt
  int get height => throw _privateConstructorUsedError;
  @dInt
  int get width => throw _privateConstructorUsedError;
  @dInt
  int get scale => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamIcon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamIcon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamIconCopyWith<FlathubAppstreamIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamIconCopyWith<$Res> {
  factory $FlathubAppstreamIconCopyWith(FlathubAppstreamIcon value,
          $Res Function(FlathubAppstreamIcon) then) =
      _$FlathubAppstreamIconCopyWithImpl<$Res, FlathubAppstreamIcon>;
  @useResult
  $Res call({String url, @dInt int height, @dInt int width, @dInt int scale});
}

/// @nodoc
class _$FlathubAppstreamIconCopyWithImpl<$Res,
        $Val extends FlathubAppstreamIcon>
    implements $FlathubAppstreamIconCopyWith<$Res> {
  _$FlathubAppstreamIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamIcon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? height = null,
    Object? width = null,
    Object? scale = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamIconImplCopyWith<$Res>
    implements $FlathubAppstreamIconCopyWith<$Res> {
  factory _$$FlathubAppstreamIconImplCopyWith(_$FlathubAppstreamIconImpl value,
          $Res Function(_$FlathubAppstreamIconImpl) then) =
      __$$FlathubAppstreamIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, @dInt int height, @dInt int width, @dInt int scale});
}

/// @nodoc
class __$$FlathubAppstreamIconImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamIconCopyWithImpl<$Res, _$FlathubAppstreamIconImpl>
    implements _$$FlathubAppstreamIconImplCopyWith<$Res> {
  __$$FlathubAppstreamIconImplCopyWithImpl(_$FlathubAppstreamIconImpl _value,
      $Res Function(_$FlathubAppstreamIconImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamIcon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? height = null,
    Object? width = null,
    Object? scale = null,
  }) {
    return _then(_$FlathubAppstreamIconImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@strToInt
class _$FlathubAppstreamIconImpl implements _FlathubAppstreamIcon {
  _$FlathubAppstreamIconImpl(
      {required this.url,
      @dInt required this.height,
      @dInt required this.width,
      @dInt required this.scale});

  factory _$FlathubAppstreamIconImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamIconImplFromJson(json);

  @override
  final String url;
  @override
  @dInt
  final int height;
  @override
  @dInt
  final int width;
  @override
  @dInt
  final int scale;

  @override
  String toString() {
    return 'FlathubAppstreamIcon(url: $url, height: $height, width: $width, scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamIconImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, height, width, scale);

  /// Create a copy of FlathubAppstreamIcon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamIconImplCopyWith<_$FlathubAppstreamIconImpl>
      get copyWith =>
          __$$FlathubAppstreamIconImplCopyWithImpl<_$FlathubAppstreamIconImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamIconImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamIcon implements FlathubAppstreamIcon {
  factory _FlathubAppstreamIcon(
      {required final String url,
      @dInt required final int height,
      @dInt required final int width,
      @dInt required final int scale}) = _$FlathubAppstreamIconImpl;

  factory _FlathubAppstreamIcon.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamIconImpl.fromJson;

  @override
  String get url;
  @override
  @dInt
  int get height;
  @override
  @dInt
  int get width;
  @override
  @dInt
  int get scale;

  /// Create a copy of FlathubAppstreamIcon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamIconImplCopyWith<_$FlathubAppstreamIconImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamBranding _$FlathubAppstreamBrandingFromJson(
    Map<String, dynamic> json) {
  return _FlathubAppstreamBranding.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamBranding {
  String get value => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(
      unknownEnumValue: FlathubAppstreamBrandingSchema.light,
      defaultValue: FlathubAppstreamBrandingSchema.light)
  FlathubAppstreamBrandingSchema get schemePreference =>
      throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamBranding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamBranding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamBrandingCopyWith<FlathubAppstreamBranding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamBrandingCopyWith<$Res> {
  factory $FlathubAppstreamBrandingCopyWith(FlathubAppstreamBranding value,
          $Res Function(FlathubAppstreamBranding) then) =
      _$FlathubAppstreamBrandingCopyWithImpl<$Res, FlathubAppstreamBranding>;
  @useResult
  $Res call(
      {String value,
      String type,
      @JsonKey(
          unknownEnumValue: FlathubAppstreamBrandingSchema.light,
          defaultValue: FlathubAppstreamBrandingSchema.light)
      FlathubAppstreamBrandingSchema schemePreference});
}

/// @nodoc
class _$FlathubAppstreamBrandingCopyWithImpl<$Res,
        $Val extends FlathubAppstreamBranding>
    implements $FlathubAppstreamBrandingCopyWith<$Res> {
  _$FlathubAppstreamBrandingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamBranding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
    Object? schemePreference = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      schemePreference: null == schemePreference
          ? _value.schemePreference
          : schemePreference // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamBrandingSchema,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamBrandingImplCopyWith<$Res>
    implements $FlathubAppstreamBrandingCopyWith<$Res> {
  factory _$$FlathubAppstreamBrandingImplCopyWith(
          _$FlathubAppstreamBrandingImpl value,
          $Res Function(_$FlathubAppstreamBrandingImpl) then) =
      __$$FlathubAppstreamBrandingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      String type,
      @JsonKey(
          unknownEnumValue: FlathubAppstreamBrandingSchema.light,
          defaultValue: FlathubAppstreamBrandingSchema.light)
      FlathubAppstreamBrandingSchema schemePreference});
}

/// @nodoc
class __$$FlathubAppstreamBrandingImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamBrandingCopyWithImpl<$Res,
        _$FlathubAppstreamBrandingImpl>
    implements _$$FlathubAppstreamBrandingImplCopyWith<$Res> {
  __$$FlathubAppstreamBrandingImplCopyWithImpl(
      _$FlathubAppstreamBrandingImpl _value,
      $Res Function(_$FlathubAppstreamBrandingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamBranding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
    Object? schemePreference = null,
  }) {
    return _then(_$FlathubAppstreamBrandingImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      schemePreference: null == schemePreference
          ? _value.schemePreference
          : schemePreference // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamBrandingSchema,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppstreamBrandingImpl implements _FlathubAppstreamBranding {
  _$FlathubAppstreamBrandingImpl(
      {required this.value,
      required this.type,
      @JsonKey(
          unknownEnumValue: FlathubAppstreamBrandingSchema.light,
          defaultValue: FlathubAppstreamBrandingSchema.light)
      required this.schemePreference});

  factory _$FlathubAppstreamBrandingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamBrandingImplFromJson(json);

  @override
  final String value;
  @override
  final String type;
  @override
  @JsonKey(
      unknownEnumValue: FlathubAppstreamBrandingSchema.light,
      defaultValue: FlathubAppstreamBrandingSchema.light)
  final FlathubAppstreamBrandingSchema schemePreference;

  @override
  String toString() {
    return 'FlathubAppstreamBranding(value: $value, type: $type, schemePreference: $schemePreference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamBrandingImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.schemePreference, schemePreference) ||
                other.schemePreference == schemePreference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, type, schemePreference);

  /// Create a copy of FlathubAppstreamBranding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamBrandingImplCopyWith<_$FlathubAppstreamBrandingImpl>
      get copyWith => __$$FlathubAppstreamBrandingImplCopyWithImpl<
          _$FlathubAppstreamBrandingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamBrandingImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamBranding implements FlathubAppstreamBranding {
  factory _FlathubAppstreamBranding(
          {required final String value,
          required final String type,
          @JsonKey(
              unknownEnumValue: FlathubAppstreamBrandingSchema.light,
              defaultValue: FlathubAppstreamBrandingSchema.light)
          required final FlathubAppstreamBrandingSchema schemePreference}) =
      _$FlathubAppstreamBrandingImpl;

  factory _FlathubAppstreamBranding.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamBrandingImpl.fromJson;

  @override
  String get value;
  @override
  String get type;
  @override
  @JsonKey(
      unknownEnumValue: FlathubAppstreamBrandingSchema.light,
      defaultValue: FlathubAppstreamBrandingSchema.light)
  FlathubAppstreamBrandingSchema get schemePreference;

  /// Create a copy of FlathubAppstreamBranding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamBrandingImplCopyWith<_$FlathubAppstreamBrandingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamUrls _$FlathubAppstreamUrlsFromJson(Map<String, dynamic> json) {
  return _FlathubAppstreamUrls.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamUrls {
  String? get bugtracker => throw _privateConstructorUsedError;
  String? get donation => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  String? get translate => throw _privateConstructorUsedError;
  String? get help => throw _privateConstructorUsedError;
  String? get faq => throw _privateConstructorUsedError;
  String? get contact => throw _privateConstructorUsedError;
  String? get vcsBrowser => throw _privateConstructorUsedError;
  String? get contribute => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamUrls to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamUrls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamUrlsCopyWith<FlathubAppstreamUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamUrlsCopyWith<$Res> {
  factory $FlathubAppstreamUrlsCopyWith(FlathubAppstreamUrls value,
          $Res Function(FlathubAppstreamUrls) then) =
      _$FlathubAppstreamUrlsCopyWithImpl<$Res, FlathubAppstreamUrls>;
  @useResult
  $Res call(
      {String? bugtracker,
      String? donation,
      String? homepage,
      String? translate,
      String? help,
      String? faq,
      String? contact,
      String? vcsBrowser,
      String? contribute});
}

/// @nodoc
class _$FlathubAppstreamUrlsCopyWithImpl<$Res,
        $Val extends FlathubAppstreamUrls>
    implements $FlathubAppstreamUrlsCopyWith<$Res> {
  _$FlathubAppstreamUrlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamUrls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bugtracker = freezed,
    Object? donation = freezed,
    Object? homepage = freezed,
    Object? translate = freezed,
    Object? help = freezed,
    Object? faq = freezed,
    Object? contact = freezed,
    Object? vcsBrowser = freezed,
    Object? contribute = freezed,
  }) {
    return _then(_value.copyWith(
      bugtracker: freezed == bugtracker
          ? _value.bugtracker
          : bugtracker // ignore: cast_nullable_to_non_nullable
              as String?,
      donation: freezed == donation
          ? _value.donation
          : donation // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      translate: freezed == translate
          ? _value.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String?,
      help: freezed == help
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as String?,
      faq: freezed == faq
          ? _value.faq
          : faq // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      vcsBrowser: freezed == vcsBrowser
          ? _value.vcsBrowser
          : vcsBrowser // ignore: cast_nullable_to_non_nullable
              as String?,
      contribute: freezed == contribute
          ? _value.contribute
          : contribute // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamUrlsImplCopyWith<$Res>
    implements $FlathubAppstreamUrlsCopyWith<$Res> {
  factory _$$FlathubAppstreamUrlsImplCopyWith(_$FlathubAppstreamUrlsImpl value,
          $Res Function(_$FlathubAppstreamUrlsImpl) then) =
      __$$FlathubAppstreamUrlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bugtracker,
      String? donation,
      String? homepage,
      String? translate,
      String? help,
      String? faq,
      String? contact,
      String? vcsBrowser,
      String? contribute});
}

/// @nodoc
class __$$FlathubAppstreamUrlsImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamUrlsCopyWithImpl<$Res, _$FlathubAppstreamUrlsImpl>
    implements _$$FlathubAppstreamUrlsImplCopyWith<$Res> {
  __$$FlathubAppstreamUrlsImplCopyWithImpl(_$FlathubAppstreamUrlsImpl _value,
      $Res Function(_$FlathubAppstreamUrlsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamUrls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bugtracker = freezed,
    Object? donation = freezed,
    Object? homepage = freezed,
    Object? translate = freezed,
    Object? help = freezed,
    Object? faq = freezed,
    Object? contact = freezed,
    Object? vcsBrowser = freezed,
    Object? contribute = freezed,
  }) {
    return _then(_$FlathubAppstreamUrlsImpl(
      bugtracker: freezed == bugtracker
          ? _value.bugtracker
          : bugtracker // ignore: cast_nullable_to_non_nullable
              as String?,
      donation: freezed == donation
          ? _value.donation
          : donation // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      translate: freezed == translate
          ? _value.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String?,
      help: freezed == help
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as String?,
      faq: freezed == faq
          ? _value.faq
          : faq // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      vcsBrowser: freezed == vcsBrowser
          ? _value.vcsBrowser
          : vcsBrowser // ignore: cast_nullable_to_non_nullable
              as String?,
      contribute: freezed == contribute
          ? _value.contribute
          : contribute // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppstreamUrlsImpl implements _FlathubAppstreamUrls {
  _$FlathubAppstreamUrlsImpl(
      {this.bugtracker,
      this.donation,
      this.homepage,
      this.translate,
      this.help,
      this.faq,
      this.contact,
      this.vcsBrowser,
      this.contribute});

  factory _$FlathubAppstreamUrlsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamUrlsImplFromJson(json);

  @override
  final String? bugtracker;
  @override
  final String? donation;
  @override
  final String? homepage;
  @override
  final String? translate;
  @override
  final String? help;
  @override
  final String? faq;
  @override
  final String? contact;
  @override
  final String? vcsBrowser;
  @override
  final String? contribute;

  @override
  String toString() {
    return 'FlathubAppstreamUrls(bugtracker: $bugtracker, donation: $donation, homepage: $homepage, translate: $translate, help: $help, faq: $faq, contact: $contact, vcsBrowser: $vcsBrowser, contribute: $contribute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamUrlsImpl &&
            (identical(other.bugtracker, bugtracker) ||
                other.bugtracker == bugtracker) &&
            (identical(other.donation, donation) ||
                other.donation == donation) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.translate, translate) ||
                other.translate == translate) &&
            (identical(other.help, help) || other.help == help) &&
            (identical(other.faq, faq) || other.faq == faq) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.vcsBrowser, vcsBrowser) ||
                other.vcsBrowser == vcsBrowser) &&
            (identical(other.contribute, contribute) ||
                other.contribute == contribute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bugtracker, donation, homepage,
      translate, help, faq, contact, vcsBrowser, contribute);

  /// Create a copy of FlathubAppstreamUrls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamUrlsImplCopyWith<_$FlathubAppstreamUrlsImpl>
      get copyWith =>
          __$$FlathubAppstreamUrlsImplCopyWithImpl<_$FlathubAppstreamUrlsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamUrlsImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamUrls implements FlathubAppstreamUrls {
  factory _FlathubAppstreamUrls(
      {final String? bugtracker,
      final String? donation,
      final String? homepage,
      final String? translate,
      final String? help,
      final String? faq,
      final String? contact,
      final String? vcsBrowser,
      final String? contribute}) = _$FlathubAppstreamUrlsImpl;

  factory _FlathubAppstreamUrls.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamUrlsImpl.fromJson;

  @override
  String? get bugtracker;
  @override
  String? get donation;
  @override
  String? get homepage;
  @override
  String? get translate;
  @override
  String? get help;
  @override
  String? get faq;
  @override
  String? get contact;
  @override
  String? get vcsBrowser;
  @override
  String? get contribute;

  /// Create a copy of FlathubAppstreamUrls
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamUrlsImplCopyWith<_$FlathubAppstreamUrlsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamScreenShot _$FlathubAppstreamScreenShotFromJson(
    Map<String, dynamic> json) {
  return _FlathubAppstreamScreenShot.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamScreenShot {
  String? get caption => throw _privateConstructorUsedError;
  @dList
  List<FlathubAppstreamScreenShotSize> get sizes =>
      throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamScreenShot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamScreenShot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamScreenShotCopyWith<FlathubAppstreamScreenShot>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamScreenShotCopyWith<$Res> {
  factory $FlathubAppstreamScreenShotCopyWith(FlathubAppstreamScreenShot value,
          $Res Function(FlathubAppstreamScreenShot) then) =
      _$FlathubAppstreamScreenShotCopyWithImpl<$Res,
          FlathubAppstreamScreenShot>;
  @useResult
  $Res call(
      {String? caption, @dList List<FlathubAppstreamScreenShotSize> sizes});
}

/// @nodoc
class _$FlathubAppstreamScreenShotCopyWithImpl<$Res,
        $Val extends FlathubAppstreamScreenShot>
    implements $FlathubAppstreamScreenShotCopyWith<$Res> {
  _$FlathubAppstreamScreenShotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamScreenShot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caption = freezed,
    Object? sizes = null,
  }) {
    return _then(_value.copyWith(
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamScreenShotSize>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamScreenShotImplCopyWith<$Res>
    implements $FlathubAppstreamScreenShotCopyWith<$Res> {
  factory _$$FlathubAppstreamScreenShotImplCopyWith(
          _$FlathubAppstreamScreenShotImpl value,
          $Res Function(_$FlathubAppstreamScreenShotImpl) then) =
      __$$FlathubAppstreamScreenShotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? caption, @dList List<FlathubAppstreamScreenShotSize> sizes});
}

/// @nodoc
class __$$FlathubAppstreamScreenShotImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamScreenShotCopyWithImpl<$Res,
        _$FlathubAppstreamScreenShotImpl>
    implements _$$FlathubAppstreamScreenShotImplCopyWith<$Res> {
  __$$FlathubAppstreamScreenShotImplCopyWithImpl(
      _$FlathubAppstreamScreenShotImpl _value,
      $Res Function(_$FlathubAppstreamScreenShotImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamScreenShot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caption = freezed,
    Object? sizes = null,
  }) {
    return _then(_$FlathubAppstreamScreenShotImpl(
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      sizes: null == sizes
          ? _value._sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamScreenShotSize>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubAppstreamScreenShotImpl implements _FlathubAppstreamScreenShot {
  _$FlathubAppstreamScreenShotImpl(
      {this.caption,
      @dList required final List<FlathubAppstreamScreenShotSize> sizes})
      : _sizes = sizes;

  factory _$FlathubAppstreamScreenShotImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FlathubAppstreamScreenShotImplFromJson(json);

  @override
  final String? caption;
  final List<FlathubAppstreamScreenShotSize> _sizes;
  @override
  @dList
  List<FlathubAppstreamScreenShotSize> get sizes {
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sizes);
  }

  @override
  String toString() {
    return 'FlathubAppstreamScreenShot(caption: $caption, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamScreenShotImpl &&
            (identical(other.caption, caption) || other.caption == caption) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, caption, const DeepCollectionEquality().hash(_sizes));

  /// Create a copy of FlathubAppstreamScreenShot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamScreenShotImplCopyWith<_$FlathubAppstreamScreenShotImpl>
      get copyWith => __$$FlathubAppstreamScreenShotImplCopyWithImpl<
          _$FlathubAppstreamScreenShotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamScreenShotImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamScreenShot
    implements FlathubAppstreamScreenShot {
  factory _FlathubAppstreamScreenShot(
          {final String? caption,
          @dList required final List<FlathubAppstreamScreenShotSize> sizes}) =
      _$FlathubAppstreamScreenShotImpl;

  factory _FlathubAppstreamScreenShot.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamScreenShotImpl.fromJson;

  @override
  String? get caption;
  @override
  @dList
  List<FlathubAppstreamScreenShotSize> get sizes;

  /// Create a copy of FlathubAppstreamScreenShot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamScreenShotImplCopyWith<_$FlathubAppstreamScreenShotImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamScreenShotSize _$FlathubAppstreamScreenShotSizeFromJson(
    Map<String, dynamic> json) {
  return _FlathubAppstreamScreenShotSize.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamScreenShotSize {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get scale => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamScreenShotSize to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamScreenShotSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamScreenShotSizeCopyWith<FlathubAppstreamScreenShotSize>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamScreenShotSizeCopyWith<$Res> {
  factory $FlathubAppstreamScreenShotSizeCopyWith(
          FlathubAppstreamScreenShotSize value,
          $Res Function(FlathubAppstreamScreenShotSize) then) =
      _$FlathubAppstreamScreenShotSizeCopyWithImpl<$Res,
          FlathubAppstreamScreenShotSize>;
  @useResult
  $Res call(
      {int width, int height, String src, String? caption, String? scale});
}

/// @nodoc
class _$FlathubAppstreamScreenShotSizeCopyWithImpl<$Res,
        $Val extends FlathubAppstreamScreenShotSize>
    implements $FlathubAppstreamScreenShotSizeCopyWith<$Res> {
  _$FlathubAppstreamScreenShotSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamScreenShotSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? src = null,
    Object? caption = freezed,
    Object? scale = freezed,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamScreenShotSizeImplCopyWith<$Res>
    implements $FlathubAppstreamScreenShotSizeCopyWith<$Res> {
  factory _$$FlathubAppstreamScreenShotSizeImplCopyWith(
          _$FlathubAppstreamScreenShotSizeImpl value,
          $Res Function(_$FlathubAppstreamScreenShotSizeImpl) then) =
      __$$FlathubAppstreamScreenShotSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int width, int height, String src, String? caption, String? scale});
}

/// @nodoc
class __$$FlathubAppstreamScreenShotSizeImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamScreenShotSizeCopyWithImpl<$Res,
        _$FlathubAppstreamScreenShotSizeImpl>
    implements _$$FlathubAppstreamScreenShotSizeImplCopyWith<$Res> {
  __$$FlathubAppstreamScreenShotSizeImplCopyWithImpl(
      _$FlathubAppstreamScreenShotSizeImpl _value,
      $Res Function(_$FlathubAppstreamScreenShotSizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamScreenShotSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? src = null,
    Object? caption = freezed,
    Object? scale = freezed,
  }) {
    return _then(_$FlathubAppstreamScreenShotSizeImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@strToInt
class _$FlathubAppstreamScreenShotSizeImpl
    implements _FlathubAppstreamScreenShotSize {
  _$FlathubAppstreamScreenShotSizeImpl(
      {required this.width,
      required this.height,
      required this.src,
      this.caption,
      this.scale});

  factory _$FlathubAppstreamScreenShotSizeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FlathubAppstreamScreenShotSizeImplFromJson(json);

  @override
  final int width;
  @override
  final int height;
  @override
  final String src;
  @override
  final String? caption;
  @override
  final String? scale;

  @override
  String toString() {
    return 'FlathubAppstreamScreenShotSize(width: $width, height: $height, src: $src, caption: $caption, scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamScreenShotSizeImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, width, height, src, caption, scale);

  /// Create a copy of FlathubAppstreamScreenShotSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamScreenShotSizeImplCopyWith<
          _$FlathubAppstreamScreenShotSizeImpl>
      get copyWith => __$$FlathubAppstreamScreenShotSizeImplCopyWithImpl<
          _$FlathubAppstreamScreenShotSizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamScreenShotSizeImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamScreenShotSize
    implements FlathubAppstreamScreenShotSize {
  factory _FlathubAppstreamScreenShotSize(
      {required final int width,
      required final int height,
      required final String src,
      final String? caption,
      final String? scale}) = _$FlathubAppstreamScreenShotSizeImpl;

  factory _FlathubAppstreamScreenShotSize.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamScreenShotSizeImpl.fromJson;

  @override
  int get width;
  @override
  int get height;
  @override
  String get src;
  @override
  String? get caption;
  @override
  String? get scale;

  /// Create a copy of FlathubAppstreamScreenShotSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamScreenShotSizeImplCopyWith<
          _$FlathubAppstreamScreenShotSizeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamRelease _$FlathubAppstreamReleaseFromJson(
    Map<String, dynamic> json) {
  return _FlathubAppstreamRelease.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamRelease {
  String get version => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  FlathubAppstreamReleaseType? get type => throw _privateConstructorUsedError;
  FlathubAppstreamReleaseUrgency? get urgency =>
      throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamRelease to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamRelease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamReleaseCopyWith<FlathubAppstreamRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamReleaseCopyWith<$Res> {
  factory $FlathubAppstreamReleaseCopyWith(FlathubAppstreamRelease value,
          $Res Function(FlathubAppstreamRelease) then) =
      _$FlathubAppstreamReleaseCopyWithImpl<$Res, FlathubAppstreamRelease>;
  @useResult
  $Res call(
      {String version,
      String? url,
      String? description,
      String? timestamp,
      FlathubAppstreamReleaseType? type,
      FlathubAppstreamReleaseUrgency? urgency});
}

/// @nodoc
class _$FlathubAppstreamReleaseCopyWithImpl<$Res,
        $Val extends FlathubAppstreamRelease>
    implements $FlathubAppstreamReleaseCopyWith<$Res> {
  _$FlathubAppstreamReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamRelease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? url = freezed,
    Object? description = freezed,
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? urgency = freezed,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamReleaseType?,
      urgency: freezed == urgency
          ? _value.urgency
          : urgency // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamReleaseUrgency?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamReleaseImplCopyWith<$Res>
    implements $FlathubAppstreamReleaseCopyWith<$Res> {
  factory _$$FlathubAppstreamReleaseImplCopyWith(
          _$FlathubAppstreamReleaseImpl value,
          $Res Function(_$FlathubAppstreamReleaseImpl) then) =
      __$$FlathubAppstreamReleaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version,
      String? url,
      String? description,
      String? timestamp,
      FlathubAppstreamReleaseType? type,
      FlathubAppstreamReleaseUrgency? urgency});
}

/// @nodoc
class __$$FlathubAppstreamReleaseImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamReleaseCopyWithImpl<$Res,
        _$FlathubAppstreamReleaseImpl>
    implements _$$FlathubAppstreamReleaseImplCopyWith<$Res> {
  __$$FlathubAppstreamReleaseImplCopyWithImpl(
      _$FlathubAppstreamReleaseImpl _value,
      $Res Function(_$FlathubAppstreamReleaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamRelease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? url = freezed,
    Object? description = freezed,
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? urgency = freezed,
  }) {
    return _then(_$FlathubAppstreamReleaseImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamReleaseType?,
      urgency: freezed == urgency
          ? _value.urgency
          : urgency // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamReleaseUrgency?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubAppstreamReleaseImpl implements _FlathubAppstreamRelease {
  _$FlathubAppstreamReleaseImpl(
      {required this.version,
      this.url,
      this.description,
      this.timestamp,
      this.type,
      this.urgency});

  factory _$FlathubAppstreamReleaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamReleaseImplFromJson(json);

  @override
  final String version;
  @override
  final String? url;
  @override
  final String? description;
  @override
  final String? timestamp;
  @override
  final FlathubAppstreamReleaseType? type;
  @override
  final FlathubAppstreamReleaseUrgency? urgency;

  @override
  String toString() {
    return 'FlathubAppstreamRelease(version: $version, url: $url, description: $description, timestamp: $timestamp, type: $type, urgency: $urgency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamReleaseImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.urgency, urgency) || other.urgency == urgency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, url, description, timestamp, type, urgency);

  /// Create a copy of FlathubAppstreamRelease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamReleaseImplCopyWith<_$FlathubAppstreamReleaseImpl>
      get copyWith => __$$FlathubAppstreamReleaseImplCopyWithImpl<
          _$FlathubAppstreamReleaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamReleaseImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamRelease implements FlathubAppstreamRelease {
  factory _FlathubAppstreamRelease(
          {required final String version,
          final String? url,
          final String? description,
          final String? timestamp,
          final FlathubAppstreamReleaseType? type,
          final FlathubAppstreamReleaseUrgency? urgency}) =
      _$FlathubAppstreamReleaseImpl;

  factory _FlathubAppstreamRelease.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamReleaseImpl.fromJson;

  @override
  String get version;
  @override
  String? get url;
  @override
  String? get description;
  @override
  String? get timestamp;
  @override
  FlathubAppstreamReleaseType? get type;
  @override
  FlathubAppstreamReleaseUrgency? get urgency;

  /// Create a copy of FlathubAppstreamRelease
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamReleaseImplCopyWith<_$FlathubAppstreamReleaseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamLaunchable _$FlathubAppstreamLaunchableFromJson(
    Map<String, dynamic> json) {
  return _FlathubAppstreamLaunchable.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamLaunchable {
  String get value => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamLaunchable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamLaunchable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamLaunchableCopyWith<FlathubAppstreamLaunchable>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamLaunchableCopyWith<$Res> {
  factory $FlathubAppstreamLaunchableCopyWith(FlathubAppstreamLaunchable value,
          $Res Function(FlathubAppstreamLaunchable) then) =
      _$FlathubAppstreamLaunchableCopyWithImpl<$Res,
          FlathubAppstreamLaunchable>;
  @useResult
  $Res call({String value, String type});
}

/// @nodoc
class _$FlathubAppstreamLaunchableCopyWithImpl<$Res,
        $Val extends FlathubAppstreamLaunchable>
    implements $FlathubAppstreamLaunchableCopyWith<$Res> {
  _$FlathubAppstreamLaunchableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamLaunchable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamLaunchableImplCopyWith<$Res>
    implements $FlathubAppstreamLaunchableCopyWith<$Res> {
  factory _$$FlathubAppstreamLaunchableImplCopyWith(
          _$FlathubAppstreamLaunchableImpl value,
          $Res Function(_$FlathubAppstreamLaunchableImpl) then) =
      __$$FlathubAppstreamLaunchableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String type});
}

/// @nodoc
class __$$FlathubAppstreamLaunchableImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamLaunchableCopyWithImpl<$Res,
        _$FlathubAppstreamLaunchableImpl>
    implements _$$FlathubAppstreamLaunchableImplCopyWith<$Res> {
  __$$FlathubAppstreamLaunchableImplCopyWithImpl(
      _$FlathubAppstreamLaunchableImpl _value,
      $Res Function(_$FlathubAppstreamLaunchableImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamLaunchable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_$FlathubAppstreamLaunchableImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubAppstreamLaunchableImpl implements _FlathubAppstreamLaunchable {
  _$FlathubAppstreamLaunchableImpl({required this.value, required this.type});

  factory _$FlathubAppstreamLaunchableImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FlathubAppstreamLaunchableImplFromJson(json);

  @override
  final String value;
  @override
  final String type;

  @override
  String toString() {
    return 'FlathubAppstreamLaunchable(value: $value, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamLaunchableImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, type);

  /// Create a copy of FlathubAppstreamLaunchable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamLaunchableImplCopyWith<_$FlathubAppstreamLaunchableImpl>
      get copyWith => __$$FlathubAppstreamLaunchableImplCopyWithImpl<
          _$FlathubAppstreamLaunchableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamLaunchableImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamLaunchable
    implements FlathubAppstreamLaunchable {
  factory _FlathubAppstreamLaunchable(
      {required final String value,
      required final String type}) = _$FlathubAppstreamLaunchableImpl;

  factory _FlathubAppstreamLaunchable.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamLaunchableImpl.fromJson;

  @override
  String get value;
  @override
  String get type;

  /// Create a copy of FlathubAppstreamLaunchable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamLaunchableImplCopyWith<_$FlathubAppstreamLaunchableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamBundle _$FlathubAppstreamBundleFromJson(
    Map<String, dynamic> json) {
  return _FlathubAppstreamBundle.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamBundle {
  String get value => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get runtime => throw _privateConstructorUsedError;
  String get sdk => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamBundle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamBundleCopyWith<FlathubAppstreamBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamBundleCopyWith<$Res> {
  factory $FlathubAppstreamBundleCopyWith(FlathubAppstreamBundle value,
          $Res Function(FlathubAppstreamBundle) then) =
      _$FlathubAppstreamBundleCopyWithImpl<$Res, FlathubAppstreamBundle>;
  @useResult
  $Res call({String value, String type, String runtime, String sdk});
}

/// @nodoc
class _$FlathubAppstreamBundleCopyWithImpl<$Res,
        $Val extends FlathubAppstreamBundle>
    implements $FlathubAppstreamBundleCopyWith<$Res> {
  _$FlathubAppstreamBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
    Object? runtime = null,
    Object? sdk = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      sdk: null == sdk
          ? _value.sdk
          : sdk // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamBundleImplCopyWith<$Res>
    implements $FlathubAppstreamBundleCopyWith<$Res> {
  factory _$$FlathubAppstreamBundleImplCopyWith(
          _$FlathubAppstreamBundleImpl value,
          $Res Function(_$FlathubAppstreamBundleImpl) then) =
      __$$FlathubAppstreamBundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String type, String runtime, String sdk});
}

/// @nodoc
class __$$FlathubAppstreamBundleImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamBundleCopyWithImpl<$Res,
        _$FlathubAppstreamBundleImpl>
    implements _$$FlathubAppstreamBundleImplCopyWith<$Res> {
  __$$FlathubAppstreamBundleImplCopyWithImpl(
      _$FlathubAppstreamBundleImpl _value,
      $Res Function(_$FlathubAppstreamBundleImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
    Object? runtime = null,
    Object? sdk = null,
  }) {
    return _then(_$FlathubAppstreamBundleImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      sdk: null == sdk
          ? _value.sdk
          : sdk // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubAppstreamBundleImpl implements _FlathubAppstreamBundle {
  _$FlathubAppstreamBundleImpl(
      {required this.value,
      required this.type,
      required this.runtime,
      required this.sdk});

  factory _$FlathubAppstreamBundleImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamBundleImplFromJson(json);

  @override
  final String value;
  @override
  final String type;
  @override
  final String runtime;
  @override
  final String sdk;

  @override
  String toString() {
    return 'FlathubAppstreamBundle(value: $value, type: $type, runtime: $runtime, sdk: $sdk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamBundleImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.sdk, sdk) || other.sdk == sdk));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, type, runtime, sdk);

  /// Create a copy of FlathubAppstreamBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamBundleImplCopyWith<_$FlathubAppstreamBundleImpl>
      get copyWith => __$$FlathubAppstreamBundleImplCopyWithImpl<
          _$FlathubAppstreamBundleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamBundleImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamBundle implements FlathubAppstreamBundle {
  factory _FlathubAppstreamBundle(
      {required final String value,
      required final String type,
      required final String runtime,
      required final String sdk}) = _$FlathubAppstreamBundleImpl;

  factory _FlathubAppstreamBundle.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamBundleImpl.fromJson;

  @override
  String get value;
  @override
  String get type;
  @override
  String get runtime;
  @override
  String get sdk;

  /// Create a copy of FlathubAppstreamBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamBundleImplCopyWith<_$FlathubAppstreamBundleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstreamMetadata _$FlathubAppstreamMetadataFromJson(
    Map<String, dynamic> json) {
  return _FlathubAppstreamMetadata.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppstreamMetadata {
  @JsonKey(name: "flathub::manifest")
  String? get manifest => throw _privateConstructorUsedError;
  @JsonKey(name: "flathub::verification::verified")
  String? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: "flathub::verification::method")
  String? get verificationMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "flathub::verification::login_name")
  String? get verificationLoginName => throw _privateConstructorUsedError;
  @JsonKey(name: "flathub::verification::login_provider")
  String? get verificationLoginProvider => throw _privateConstructorUsedError;
  @JsonKey(name: "flathub::verification::website")
  String? get verificationLoginWebsite => throw _privateConstructorUsedError;
  @JsonKey(name: "flathub::verification::timestamp")
  String? get verificationTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: "flathub::verification::login_is_organization")
  String? get verificationLoginIsOrganization =>
      throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstreamMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstreamMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamMetadataCopyWith<FlathubAppstreamMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamMetadataCopyWith<$Res> {
  factory $FlathubAppstreamMetadataCopyWith(FlathubAppstreamMetadata value,
          $Res Function(FlathubAppstreamMetadata) then) =
      _$FlathubAppstreamMetadataCopyWithImpl<$Res, FlathubAppstreamMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: "flathub::manifest") String? manifest,
      @JsonKey(name: "flathub::verification::verified") String? verified,
      @JsonKey(name: "flathub::verification::method")
      String? verificationMethod,
      @JsonKey(name: "flathub::verification::login_name")
      String? verificationLoginName,
      @JsonKey(name: "flathub::verification::login_provider")
      String? verificationLoginProvider,
      @JsonKey(name: "flathub::verification::website")
      String? verificationLoginWebsite,
      @JsonKey(name: "flathub::verification::timestamp")
      String? verificationTimestamp,
      @JsonKey(name: "flathub::verification::login_is_organization")
      String? verificationLoginIsOrganization});
}

/// @nodoc
class _$FlathubAppstreamMetadataCopyWithImpl<$Res,
        $Val extends FlathubAppstreamMetadata>
    implements $FlathubAppstreamMetadataCopyWith<$Res> {
  _$FlathubAppstreamMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstreamMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifest = freezed,
    Object? verified = freezed,
    Object? verificationMethod = freezed,
    Object? verificationLoginName = freezed,
    Object? verificationLoginProvider = freezed,
    Object? verificationLoginWebsite = freezed,
    Object? verificationTimestamp = freezed,
    Object? verificationLoginIsOrganization = freezed,
  }) {
    return _then(_value.copyWith(
      manifest: freezed == manifest
          ? _value.manifest
          : manifest // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginName: freezed == verificationLoginName
          ? _value.verificationLoginName
          : verificationLoginName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginProvider: freezed == verificationLoginProvider
          ? _value.verificationLoginProvider
          : verificationLoginProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginWebsite: freezed == verificationLoginWebsite
          ? _value.verificationLoginWebsite
          : verificationLoginWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationTimestamp: freezed == verificationTimestamp
          ? _value.verificationTimestamp
          : verificationTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginIsOrganization: freezed ==
              verificationLoginIsOrganization
          ? _value.verificationLoginIsOrganization
          : verificationLoginIsOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamMetadataImplCopyWith<$Res>
    implements $FlathubAppstreamMetadataCopyWith<$Res> {
  factory _$$FlathubAppstreamMetadataImplCopyWith(
          _$FlathubAppstreamMetadataImpl value,
          $Res Function(_$FlathubAppstreamMetadataImpl) then) =
      __$$FlathubAppstreamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "flathub::manifest") String? manifest,
      @JsonKey(name: "flathub::verification::verified") String? verified,
      @JsonKey(name: "flathub::verification::method")
      String? verificationMethod,
      @JsonKey(name: "flathub::verification::login_name")
      String? verificationLoginName,
      @JsonKey(name: "flathub::verification::login_provider")
      String? verificationLoginProvider,
      @JsonKey(name: "flathub::verification::website")
      String? verificationLoginWebsite,
      @JsonKey(name: "flathub::verification::timestamp")
      String? verificationTimestamp,
      @JsonKey(name: "flathub::verification::login_is_organization")
      String? verificationLoginIsOrganization});
}

/// @nodoc
class __$$FlathubAppstreamMetadataImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamMetadataCopyWithImpl<$Res,
        _$FlathubAppstreamMetadataImpl>
    implements _$$FlathubAppstreamMetadataImplCopyWith<$Res> {
  __$$FlathubAppstreamMetadataImplCopyWithImpl(
      _$FlathubAppstreamMetadataImpl _value,
      $Res Function(_$FlathubAppstreamMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstreamMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifest = freezed,
    Object? verified = freezed,
    Object? verificationMethod = freezed,
    Object? verificationLoginName = freezed,
    Object? verificationLoginProvider = freezed,
    Object? verificationLoginWebsite = freezed,
    Object? verificationTimestamp = freezed,
    Object? verificationLoginIsOrganization = freezed,
  }) {
    return _then(_$FlathubAppstreamMetadataImpl(
      manifest: freezed == manifest
          ? _value.manifest
          : manifest // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginName: freezed == verificationLoginName
          ? _value.verificationLoginName
          : verificationLoginName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginProvider: freezed == verificationLoginProvider
          ? _value.verificationLoginProvider
          : verificationLoginProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginWebsite: freezed == verificationLoginWebsite
          ? _value.verificationLoginWebsite
          : verificationLoginWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationTimestamp: freezed == verificationTimestamp
          ? _value.verificationTimestamp
          : verificationTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginIsOrganization: freezed ==
              verificationLoginIsOrganization
          ? _value.verificationLoginIsOrganization
          : verificationLoginIsOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubAppstreamMetadataImpl implements _FlathubAppstreamMetadata {
  _$FlathubAppstreamMetadataImpl(
      {@JsonKey(name: "flathub::manifest") this.manifest,
      @JsonKey(name: "flathub::verification::verified") this.verified,
      @JsonKey(name: "flathub::verification::method") this.verificationMethod,
      @JsonKey(name: "flathub::verification::login_name")
      this.verificationLoginName,
      @JsonKey(name: "flathub::verification::login_provider")
      this.verificationLoginProvider,
      @JsonKey(name: "flathub::verification::website")
      this.verificationLoginWebsite,
      @JsonKey(name: "flathub::verification::timestamp")
      this.verificationTimestamp,
      @JsonKey(name: "flathub::verification::login_is_organization")
      this.verificationLoginIsOrganization});

  factory _$FlathubAppstreamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamMetadataImplFromJson(json);

  @override
  @JsonKey(name: "flathub::manifest")
  final String? manifest;
  @override
  @JsonKey(name: "flathub::verification::verified")
  final String? verified;
  @override
  @JsonKey(name: "flathub::verification::method")
  final String? verificationMethod;
  @override
  @JsonKey(name: "flathub::verification::login_name")
  final String? verificationLoginName;
  @override
  @JsonKey(name: "flathub::verification::login_provider")
  final String? verificationLoginProvider;
  @override
  @JsonKey(name: "flathub::verification::website")
  final String? verificationLoginWebsite;
  @override
  @JsonKey(name: "flathub::verification::timestamp")
  final String? verificationTimestamp;
  @override
  @JsonKey(name: "flathub::verification::login_is_organization")
  final String? verificationLoginIsOrganization;

  @override
  String toString() {
    return 'FlathubAppstreamMetadata(manifest: $manifest, verified: $verified, verificationMethod: $verificationMethod, verificationLoginName: $verificationLoginName, verificationLoginProvider: $verificationLoginProvider, verificationLoginWebsite: $verificationLoginWebsite, verificationTimestamp: $verificationTimestamp, verificationLoginIsOrganization: $verificationLoginIsOrganization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamMetadataImpl &&
            (identical(other.manifest, manifest) ||
                other.manifest == manifest) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.verificationMethod, verificationMethod) ||
                other.verificationMethod == verificationMethod) &&
            (identical(other.verificationLoginName, verificationLoginName) ||
                other.verificationLoginName == verificationLoginName) &&
            (identical(other.verificationLoginProvider,
                    verificationLoginProvider) ||
                other.verificationLoginProvider == verificationLoginProvider) &&
            (identical(
                    other.verificationLoginWebsite, verificationLoginWebsite) ||
                other.verificationLoginWebsite == verificationLoginWebsite) &&
            (identical(other.verificationTimestamp, verificationTimestamp) ||
                other.verificationTimestamp == verificationTimestamp) &&
            (identical(other.verificationLoginIsOrganization,
                    verificationLoginIsOrganization) ||
                other.verificationLoginIsOrganization ==
                    verificationLoginIsOrganization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      manifest,
      verified,
      verificationMethod,
      verificationLoginName,
      verificationLoginProvider,
      verificationLoginWebsite,
      verificationTimestamp,
      verificationLoginIsOrganization);

  /// Create a copy of FlathubAppstreamMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamMetadataImplCopyWith<_$FlathubAppstreamMetadataImpl>
      get copyWith => __$$FlathubAppstreamMetadataImplCopyWithImpl<
          _$FlathubAppstreamMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamMetadataImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppstreamMetadata implements FlathubAppstreamMetadata {
  factory _FlathubAppstreamMetadata(
      {@JsonKey(name: "flathub::manifest") final String? manifest,
      @JsonKey(name: "flathub::verification::verified") final String? verified,
      @JsonKey(name: "flathub::verification::method")
      final String? verificationMethod,
      @JsonKey(name: "flathub::verification::login_name")
      final String? verificationLoginName,
      @JsonKey(name: "flathub::verification::login_provider")
      final String? verificationLoginProvider,
      @JsonKey(name: "flathub::verification::website")
      final String? verificationLoginWebsite,
      @JsonKey(name: "flathub::verification::timestamp")
      final String? verificationTimestamp,
      @JsonKey(name: "flathub::verification::login_is_organization")
      final String?
          verificationLoginIsOrganization}) = _$FlathubAppstreamMetadataImpl;

  factory _FlathubAppstreamMetadata.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamMetadataImpl.fromJson;

  @override
  @JsonKey(name: "flathub::manifest")
  String? get manifest;
  @override
  @JsonKey(name: "flathub::verification::verified")
  String? get verified;
  @override
  @JsonKey(name: "flathub::verification::method")
  String? get verificationMethod;
  @override
  @JsonKey(name: "flathub::verification::login_name")
  String? get verificationLoginName;
  @override
  @JsonKey(name: "flathub::verification::login_provider")
  String? get verificationLoginProvider;
  @override
  @JsonKey(name: "flathub::verification::website")
  String? get verificationLoginWebsite;
  @override
  @JsonKey(name: "flathub::verification::timestamp")
  String? get verificationTimestamp;
  @override
  @JsonKey(name: "flathub::verification::login_is_organization")
  String? get verificationLoginIsOrganization;

  /// Create a copy of FlathubAppstreamMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamMetadataImplCopyWith<_$FlathubAppstreamMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubAppstream _$FlathubAppstreamFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'addon':
      return FlathubAppstreamAddon.fromJson(json);

    default:
      return FlathubAppstreamDesktop.fromJson(json);
  }
}

/// @nodoc
mixin _$FlathubAppstream {
  String? get summary => throw _privateConstructorUsedError;
  @dList
  List<FlathubAppstreamRelease> get releases =>
      throw _privateConstructorUsedError;
  FlathubAppstreamUrls? get urls => throw _privateConstructorUsedError;
  @dList
  List<FlathubAppstreamIcon> get icons => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get developerName => throw _privateConstructorUsedError;
  String? get projectLicense => throw _privateConstructorUsedError;
  FlathubAppstreamBundle get bundle => throw _privateConstructorUsedError;
  FlathubAppstreamMetadata? get metadata => throw _privateConstructorUsedError;
  @dBool
  bool get isFreeLicense => throw _privateConstructorUsedError;
  String? get projectGroup => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)
        desktop,
    required TResult Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)
        addon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)?
        desktop,
    TResult? Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)?
        addon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)?
        desktop,
    TResult Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)?
        addon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlathubAppstreamDesktop value) desktop,
    required TResult Function(FlathubAppstreamAddon value) addon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FlathubAppstreamDesktop value)? desktop,
    TResult? Function(FlathubAppstreamAddon value)? addon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlathubAppstreamDesktop value)? desktop,
    TResult Function(FlathubAppstreamAddon value)? addon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this FlathubAppstream to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppstreamCopyWith<FlathubAppstream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppstreamCopyWith<$Res> {
  factory $FlathubAppstreamCopyWith(
          FlathubAppstream value, $Res Function(FlathubAppstream) then) =
      _$FlathubAppstreamCopyWithImpl<$Res, FlathubAppstream>;
  @useResult
  $Res call(
      {String? summary,
      @dList List<FlathubAppstreamRelease> releases,
      FlathubAppstreamUrls? urls,
      @dList List<FlathubAppstreamIcon> icons,
      String id,
      String name,
      String? icon,
      String? developerName,
      String? projectLicense,
      FlathubAppstreamBundle bundle,
      FlathubAppstreamMetadata? metadata,
      @dBool bool isFreeLicense,
      String? projectGroup});

  $FlathubAppstreamUrlsCopyWith<$Res>? get urls;
  $FlathubAppstreamBundleCopyWith<$Res> get bundle;
  $FlathubAppstreamMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$FlathubAppstreamCopyWithImpl<$Res, $Val extends FlathubAppstream>
    implements $FlathubAppstreamCopyWith<$Res> {
  _$FlathubAppstreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? releases = null,
    Object? urls = freezed,
    Object? icons = null,
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? developerName = freezed,
    Object? projectLicense = freezed,
    Object? bundle = null,
    Object? metadata = freezed,
    Object? isFreeLicense = null,
    Object? projectGroup = freezed,
  }) {
    return _then(_value.copyWith(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      releases: null == releases
          ? _value.releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamRelease>,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamUrls?,
      icons: null == icons
          ? _value.icons
          : icons // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamIcon>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name!
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      developerName: freezed == developerName
          ? _value.developerName
          : developerName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectLicense: freezed == projectLicense
          ? _value.projectLicense
          : projectLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamBundle,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamMetadata?,
      isFreeLicense: null == isFreeLicense
          ? _value.isFreeLicense
          : isFreeLicense // ignore: cast_nullable_to_non_nullable
              as bool,
      projectGroup: freezed == projectGroup
          ? _value.projectGroup
          : projectGroup // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubAppstreamUrlsCopyWith<$Res>? get urls {
    if (_value.urls == null) {
      return null;
    }

    return $FlathubAppstreamUrlsCopyWith<$Res>(_value.urls!, (value) {
      return _then(_value.copyWith(urls: value) as $Val);
    });
  }

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubAppstreamBundleCopyWith<$Res> get bundle {
    return $FlathubAppstreamBundleCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value) as $Val);
    });
  }

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubAppstreamMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $FlathubAppstreamMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlathubAppstreamDesktopImplCopyWith<$Res>
    implements $FlathubAppstreamCopyWith<$Res> {
  factory _$$FlathubAppstreamDesktopImplCopyWith(
          _$FlathubAppstreamDesktopImpl value,
          $Res Function(_$FlathubAppstreamDesktopImpl) then) =
      __$$FlathubAppstreamDesktopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? summary,
      String? description,
      @dList List<FlathubAppstreamScreenShot> screenshots,
      @dList List<FlathubAppstreamRelease> releases,
      FlathubAppstreamUrls? urls,
      @dList List<FlathubAppstreamIcon> icons,
      String id,
      String name,
      String? icon,
      String? developerName,
      @dList List<String> categories,
      @dList List<String> kudos,
      @dList List<String> mimetypes,
      String? projectLicense,
      FlathubAppstreamLaunchable launchable,
      FlathubAppstreamBundle bundle,
      FlathubAppstreamMetadata? metadata,
      @dList List<String> keywords,
      @dBool bool isFreeLicense,
      @dList List<FlathubAppstreamBranding> branding,
      String? projectGroup});

  @override
  $FlathubAppstreamUrlsCopyWith<$Res>? get urls;
  $FlathubAppstreamLaunchableCopyWith<$Res> get launchable;
  @override
  $FlathubAppstreamBundleCopyWith<$Res> get bundle;
  @override
  $FlathubAppstreamMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$FlathubAppstreamDesktopImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamCopyWithImpl<$Res, _$FlathubAppstreamDesktopImpl>
    implements _$$FlathubAppstreamDesktopImplCopyWith<$Res> {
  __$$FlathubAppstreamDesktopImplCopyWithImpl(
      _$FlathubAppstreamDesktopImpl _value,
      $Res Function(_$FlathubAppstreamDesktopImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? description = freezed,
    Object? screenshots = null,
    Object? releases = null,
    Object? urls = freezed,
    Object? icons = null,
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? developerName = freezed,
    Object? categories = null,
    Object? kudos = null,
    Object? mimetypes = null,
    Object? projectLicense = freezed,
    Object? launchable = null,
    Object? bundle = null,
    Object? metadata = freezed,
    Object? keywords = null,
    Object? isFreeLicense = null,
    Object? branding = null,
    Object? projectGroup = freezed,
  }) {
    return _then(_$FlathubAppstreamDesktopImpl(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshots: null == screenshots
          ? _value._screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamScreenShot>,
      releases: null == releases
          ? _value._releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamRelease>,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamUrls?,
      icons: null == icons
          ? _value._icons
          : icons // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamIcon>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      developerName: freezed == developerName
          ? _value.developerName
          : developerName // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      kudos: null == kudos
          ? _value._kudos
          : kudos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mimetypes: null == mimetypes
          ? _value._mimetypes
          : mimetypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      projectLicense: freezed == projectLicense
          ? _value.projectLicense
          : projectLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      launchable: null == launchable
          ? _value.launchable
          : launchable // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamLaunchable,
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamBundle,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamMetadata?,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFreeLicense: null == isFreeLicense
          ? _value.isFreeLicense
          : isFreeLicense // ignore: cast_nullable_to_non_nullable
              as bool,
      branding: null == branding
          ? _value._branding
          : branding // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamBranding>,
      projectGroup: freezed == projectGroup
          ? _value.projectGroup
          : projectGroup // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubAppstreamLaunchableCopyWith<$Res> get launchable {
    return $FlathubAppstreamLaunchableCopyWith<$Res>(_value.launchable,
        (value) {
      return _then(_value.copyWith(launchable: value));
    });
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppstreamDesktopImpl implements FlathubAppstreamDesktop {
  _$FlathubAppstreamDesktopImpl(
      {this.summary,
      this.description,
      @dList required final List<FlathubAppstreamScreenShot> screenshots,
      @dList required final List<FlathubAppstreamRelease> releases,
      this.urls,
      @dList required final List<FlathubAppstreamIcon> icons,
      required this.id,
      required this.name,
      this.icon,
      this.developerName,
      @dList required final List<String> categories,
      @dList required final List<String> kudos,
      @dList required final List<String> mimetypes,
      this.projectLicense,
      required this.launchable,
      required this.bundle,
      this.metadata,
      @dList required final List<String> keywords,
      @dBool required this.isFreeLicense,
      @dList required final List<FlathubAppstreamBranding> branding,
      this.projectGroup,
      final String? $type})
      : _screenshots = screenshots,
        _releases = releases,
        _icons = icons,
        _categories = categories,
        _kudos = kudos,
        _mimetypes = mimetypes,
        _keywords = keywords,
        _branding = branding,
        $type = $type ?? 'desktop';

  factory _$FlathubAppstreamDesktopImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamDesktopImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? description;
  final List<FlathubAppstreamScreenShot> _screenshots;
  @override
  @dList
  List<FlathubAppstreamScreenShot> get screenshots {
    if (_screenshots is EqualUnmodifiableListView) return _screenshots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_screenshots);
  }

  final List<FlathubAppstreamRelease> _releases;
  @override
  @dList
  List<FlathubAppstreamRelease> get releases {
    if (_releases is EqualUnmodifiableListView) return _releases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releases);
  }

  @override
  final FlathubAppstreamUrls? urls;
  final List<FlathubAppstreamIcon> _icons;
  @override
  @dList
  List<FlathubAppstreamIcon> get icons {
    if (_icons is EqualUnmodifiableListView) return _icons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_icons);
  }

  @override
  final String id;
  @override
  final String name;
  @override
  final String? icon;
  @override
  final String? developerName;
  final List<String> _categories;
  @override
  @dList
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<String> _kudos;
  @override
  @dList
  List<String> get kudos {
    if (_kudos is EqualUnmodifiableListView) return _kudos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kudos);
  }

  final List<String> _mimetypes;
  @override
  @dList
  List<String> get mimetypes {
    if (_mimetypes is EqualUnmodifiableListView) return _mimetypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mimetypes);
  }

  @override
  final String? projectLicense;
  @override
  final FlathubAppstreamLaunchable launchable;
  @override
  final FlathubAppstreamBundle bundle;
  @override
  final FlathubAppstreamMetadata? metadata;
  final List<String> _keywords;
  @override
  @dList
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  @dBool
  final bool isFreeLicense;
  final List<FlathubAppstreamBranding> _branding;
  @override
  @dList
  List<FlathubAppstreamBranding> get branding {
    if (_branding is EqualUnmodifiableListView) return _branding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branding);
  }

  @override
  final String? projectGroup;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FlathubAppstream.desktop(summary: $summary, description: $description, screenshots: $screenshots, releases: $releases, urls: $urls, icons: $icons, id: $id, name: $name, icon: $icon, developerName: $developerName, categories: $categories, kudos: $kudos, mimetypes: $mimetypes, projectLicense: $projectLicense, launchable: $launchable, bundle: $bundle, metadata: $metadata, keywords: $keywords, isFreeLicense: $isFreeLicense, branding: $branding, projectGroup: $projectGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamDesktopImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._screenshots, _screenshots) &&
            const DeepCollectionEquality().equals(other._releases, _releases) &&
            (identical(other.urls, urls) || other.urls == urls) &&
            const DeepCollectionEquality().equals(other._icons, _icons) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.developerName, developerName) ||
                other.developerName == developerName) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._kudos, _kudos) &&
            const DeepCollectionEquality()
                .equals(other._mimetypes, _mimetypes) &&
            (identical(other.projectLicense, projectLicense) ||
                other.projectLicense == projectLicense) &&
            (identical(other.launchable, launchable) ||
                other.launchable == launchable) &&
            (identical(other.bundle, bundle) || other.bundle == bundle) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.isFreeLicense, isFreeLicense) ||
                other.isFreeLicense == isFreeLicense) &&
            const DeepCollectionEquality().equals(other._branding, _branding) &&
            (identical(other.projectGroup, projectGroup) ||
                other.projectGroup == projectGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        summary,
        description,
        const DeepCollectionEquality().hash(_screenshots),
        const DeepCollectionEquality().hash(_releases),
        urls,
        const DeepCollectionEquality().hash(_icons),
        id,
        name,
        icon,
        developerName,
        const DeepCollectionEquality().hash(_categories),
        const DeepCollectionEquality().hash(_kudos),
        const DeepCollectionEquality().hash(_mimetypes),
        projectLicense,
        launchable,
        bundle,
        metadata,
        const DeepCollectionEquality().hash(_keywords),
        isFreeLicense,
        const DeepCollectionEquality().hash(_branding),
        projectGroup
      ]);

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamDesktopImplCopyWith<_$FlathubAppstreamDesktopImpl>
      get copyWith => __$$FlathubAppstreamDesktopImplCopyWithImpl<
          _$FlathubAppstreamDesktopImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)
        desktop,
    required TResult Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)
        addon,
  }) {
    return desktop(
        summary,
        description,
        screenshots,
        releases,
        urls,
        icons,
        id,
        name,
        icon,
        developerName,
        categories,
        kudos,
        mimetypes,
        projectLicense,
        launchable,
        bundle,
        metadata,
        keywords,
        isFreeLicense,
        branding,
        projectGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)?
        desktop,
    TResult? Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)?
        addon,
  }) {
    return desktop?.call(
        summary,
        description,
        screenshots,
        releases,
        urls,
        icons,
        id,
        name,
        icon,
        developerName,
        categories,
        kudos,
        mimetypes,
        projectLicense,
        launchable,
        bundle,
        metadata,
        keywords,
        isFreeLicense,
        branding,
        projectGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)?
        desktop,
    TResult Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)?
        addon,
    required TResult orElse(),
  }) {
    if (desktop != null) {
      return desktop(
          summary,
          description,
          screenshots,
          releases,
          urls,
          icons,
          id,
          name,
          icon,
          developerName,
          categories,
          kudos,
          mimetypes,
          projectLicense,
          launchable,
          bundle,
          metadata,
          keywords,
          isFreeLicense,
          branding,
          projectGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlathubAppstreamDesktop value) desktop,
    required TResult Function(FlathubAppstreamAddon value) addon,
  }) {
    return desktop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FlathubAppstreamDesktop value)? desktop,
    TResult? Function(FlathubAppstreamAddon value)? addon,
  }) {
    return desktop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlathubAppstreamDesktop value)? desktop,
    TResult Function(FlathubAppstreamAddon value)? addon,
    required TResult orElse(),
  }) {
    if (desktop != null) {
      return desktop(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamDesktopImplToJson(
      this,
    );
  }
}

abstract class FlathubAppstreamDesktop implements FlathubAppstream {
  factory FlathubAppstreamDesktop(
      {final String? summary,
      final String? description,
      @dList required final List<FlathubAppstreamScreenShot> screenshots,
      @dList required final List<FlathubAppstreamRelease> releases,
      final FlathubAppstreamUrls? urls,
      @dList required final List<FlathubAppstreamIcon> icons,
      required final String id,
      required final String name,
      final String? icon,
      final String? developerName,
      @dList required final List<String> categories,
      @dList required final List<String> kudos,
      @dList required final List<String> mimetypes,
      final String? projectLicense,
      required final FlathubAppstreamLaunchable launchable,
      required final FlathubAppstreamBundle bundle,
      final FlathubAppstreamMetadata? metadata,
      @dList required final List<String> keywords,
      @dBool required final bool isFreeLicense,
      @dList required final List<FlathubAppstreamBranding> branding,
      final String? projectGroup}) = _$FlathubAppstreamDesktopImpl;

  factory FlathubAppstreamDesktop.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamDesktopImpl.fromJson;

  @override
  String? get summary;
  String? get description;
  @dList
  List<FlathubAppstreamScreenShot> get screenshots;
  @override
  @dList
  List<FlathubAppstreamRelease> get releases;
  @override
  FlathubAppstreamUrls? get urls;
  @override
  @dList
  List<FlathubAppstreamIcon> get icons;
  @override
  String get id;
  @override
  String get name;
  @override
  String? get icon;
  @override
  String? get developerName;
  @dList
  List<String> get categories;
  @dList
  List<String> get kudos;
  @dList
  List<String> get mimetypes;
  @override
  String? get projectLicense;
  FlathubAppstreamLaunchable get launchable;
  @override
  FlathubAppstreamBundle get bundle;
  @override
  FlathubAppstreamMetadata? get metadata;
  @dList
  List<String> get keywords;
  @override
  @dBool
  bool get isFreeLicense;
  @dList
  List<FlathubAppstreamBranding> get branding;
  @override
  String? get projectGroup;

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamDesktopImplCopyWith<_$FlathubAppstreamDesktopImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FlathubAppstreamAddonImplCopyWith<$Res>
    implements $FlathubAppstreamCopyWith<$Res> {
  factory _$$FlathubAppstreamAddonImplCopyWith(
          _$FlathubAppstreamAddonImpl value,
          $Res Function(_$FlathubAppstreamAddonImpl) then) =
      __$$FlathubAppstreamAddonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@dList List<FlathubAppstreamRelease> releases,
      FlathubAppstreamUrls? urls,
      String? icon,
      @dList List<FlathubAppstreamIcon> icons,
      String id,
      String? name,
      String? developerName,
      String? summary,
      String? projectLicense,
      @JsonKey(name: "extends") String extendsApp,
      FlathubAppstreamBundle bundle,
      FlathubAppstreamMetadata? metadata,
      @dBool bool isFreeLicense,
      String? projectGroup});

  @override
  $FlathubAppstreamUrlsCopyWith<$Res>? get urls;
  @override
  $FlathubAppstreamBundleCopyWith<$Res> get bundle;
  @override
  $FlathubAppstreamMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$FlathubAppstreamAddonImplCopyWithImpl<$Res>
    extends _$FlathubAppstreamCopyWithImpl<$Res, _$FlathubAppstreamAddonImpl>
    implements _$$FlathubAppstreamAddonImplCopyWith<$Res> {
  __$$FlathubAppstreamAddonImplCopyWithImpl(_$FlathubAppstreamAddonImpl _value,
      $Res Function(_$FlathubAppstreamAddonImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releases = null,
    Object? urls = freezed,
    Object? icon = freezed,
    Object? icons = null,
    Object? id = null,
    Object? name = freezed,
    Object? developerName = freezed,
    Object? summary = freezed,
    Object? projectLicense = freezed,
    Object? extendsApp = null,
    Object? bundle = null,
    Object? metadata = freezed,
    Object? isFreeLicense = null,
    Object? projectGroup = freezed,
  }) {
    return _then(_$FlathubAppstreamAddonImpl(
      releases: null == releases
          ? _value._releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamRelease>,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamUrls?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      icons: null == icons
          ? _value._icons
          : icons // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppstreamIcon>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      developerName: freezed == developerName
          ? _value.developerName
          : developerName // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      projectLicense: freezed == projectLicense
          ? _value.projectLicense
          : projectLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      extendsApp: null == extendsApp
          ? _value.extendsApp
          : extendsApp // ignore: cast_nullable_to_non_nullable
              as String,
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamBundle,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FlathubAppstreamMetadata?,
      isFreeLicense: null == isFreeLicense
          ? _value.isFreeLicense
          : isFreeLicense // ignore: cast_nullable_to_non_nullable
              as bool,
      projectGroup: freezed == projectGroup
          ? _value.projectGroup
          : projectGroup // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppstreamAddonImpl implements FlathubAppstreamAddon {
  _$FlathubAppstreamAddonImpl(
      {@dList required final List<FlathubAppstreamRelease> releases,
      this.urls,
      this.icon,
      @dList required final List<FlathubAppstreamIcon> icons,
      required this.id,
      this.name,
      this.developerName,
      this.summary,
      this.projectLicense,
      @JsonKey(name: "extends") required this.extendsApp,
      required this.bundle,
      this.metadata,
      @dBool required this.isFreeLicense,
      this.projectGroup,
      final String? $type})
      : _releases = releases,
        _icons = icons,
        $type = $type ?? 'addon';

  factory _$FlathubAppstreamAddonImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppstreamAddonImplFromJson(json);

  final List<FlathubAppstreamRelease> _releases;
  @override
  @dList
  List<FlathubAppstreamRelease> get releases {
    if (_releases is EqualUnmodifiableListView) return _releases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releases);
  }

  @override
  final FlathubAppstreamUrls? urls;
  @override
  final String? icon;
  final List<FlathubAppstreamIcon> _icons;
  @override
  @dList
  List<FlathubAppstreamIcon> get icons {
    if (_icons is EqualUnmodifiableListView) return _icons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_icons);
  }

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? developerName;
  @override
  final String? summary;
  @override
  final String? projectLicense;
  @override
  @JsonKey(name: "extends")
  final String extendsApp;
  @override
  final FlathubAppstreamBundle bundle;
  @override
  final FlathubAppstreamMetadata? metadata;
  @override
  @dBool
  final bool isFreeLicense;
  @override
  final String? projectGroup;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'FlathubAppstream.addon(releases: $releases, urls: $urls, icon: $icon, icons: $icons, id: $id, name: $name, developerName: $developerName, summary: $summary, projectLicense: $projectLicense, extendsApp: $extendsApp, bundle: $bundle, metadata: $metadata, isFreeLicense: $isFreeLicense, projectGroup: $projectGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppstreamAddonImpl &&
            const DeepCollectionEquality().equals(other._releases, _releases) &&
            (identical(other.urls, urls) || other.urls == urls) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._icons, _icons) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.developerName, developerName) ||
                other.developerName == developerName) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.projectLicense, projectLicense) ||
                other.projectLicense == projectLicense) &&
            (identical(other.extendsApp, extendsApp) ||
                other.extendsApp == extendsApp) &&
            (identical(other.bundle, bundle) || other.bundle == bundle) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.isFreeLicense, isFreeLicense) ||
                other.isFreeLicense == isFreeLicense) &&
            (identical(other.projectGroup, projectGroup) ||
                other.projectGroup == projectGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_releases),
      urls,
      icon,
      const DeepCollectionEquality().hash(_icons),
      id,
      name,
      developerName,
      summary,
      projectLicense,
      extendsApp,
      bundle,
      metadata,
      isFreeLicense,
      projectGroup);

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppstreamAddonImplCopyWith<_$FlathubAppstreamAddonImpl>
      get copyWith => __$$FlathubAppstreamAddonImplCopyWithImpl<
          _$FlathubAppstreamAddonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)
        desktop,
    required TResult Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)
        addon,
  }) {
    return addon(
        releases,
        urls,
        icon,
        icons,
        id,
        name,
        developerName,
        summary,
        projectLicense,
        extendsApp,
        bundle,
        metadata,
        isFreeLicense,
        projectGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)?
        desktop,
    TResult? Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)?
        addon,
  }) {
    return addon?.call(
        releases,
        urls,
        icon,
        icons,
        id,
        name,
        developerName,
        summary,
        projectLicense,
        extendsApp,
        bundle,
        metadata,
        isFreeLicense,
        projectGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? summary,
            String? description,
            @dList List<FlathubAppstreamScreenShot> screenshots,
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String name,
            String? icon,
            String? developerName,
            @dList List<String> categories,
            @dList List<String> kudos,
            @dList List<String> mimetypes,
            String? projectLicense,
            FlathubAppstreamLaunchable launchable,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dList List<String> keywords,
            @dBool bool isFreeLicense,
            @dList List<FlathubAppstreamBranding> branding,
            String? projectGroup)?
        desktop,
    TResult Function(
            @dList List<FlathubAppstreamRelease> releases,
            FlathubAppstreamUrls? urls,
            String? icon,
            @dList List<FlathubAppstreamIcon> icons,
            String id,
            String? name,
            String? developerName,
            String? summary,
            String? projectLicense,
            @JsonKey(name: "extends") String extendsApp,
            FlathubAppstreamBundle bundle,
            FlathubAppstreamMetadata? metadata,
            @dBool bool isFreeLicense,
            String? projectGroup)?
        addon,
    required TResult orElse(),
  }) {
    if (addon != null) {
      return addon(
          releases,
          urls,
          icon,
          icons,
          id,
          name,
          developerName,
          summary,
          projectLicense,
          extendsApp,
          bundle,
          metadata,
          isFreeLicense,
          projectGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlathubAppstreamDesktop value) desktop,
    required TResult Function(FlathubAppstreamAddon value) addon,
  }) {
    return addon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FlathubAppstreamDesktop value)? desktop,
    TResult? Function(FlathubAppstreamAddon value)? addon,
  }) {
    return addon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlathubAppstreamDesktop value)? desktop,
    TResult Function(FlathubAppstreamAddon value)? addon,
    required TResult orElse(),
  }) {
    if (addon != null) {
      return addon(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppstreamAddonImplToJson(
      this,
    );
  }
}

abstract class FlathubAppstreamAddon implements FlathubAppstream {
  factory FlathubAppstreamAddon(
      {@dList required final List<FlathubAppstreamRelease> releases,
      final FlathubAppstreamUrls? urls,
      final String? icon,
      @dList required final List<FlathubAppstreamIcon> icons,
      required final String id,
      final String? name,
      final String? developerName,
      final String? summary,
      final String? projectLicense,
      @JsonKey(name: "extends") required final String extendsApp,
      required final FlathubAppstreamBundle bundle,
      final FlathubAppstreamMetadata? metadata,
      @dBool required final bool isFreeLicense,
      final String? projectGroup}) = _$FlathubAppstreamAddonImpl;

  factory FlathubAppstreamAddon.fromJson(Map<String, dynamic> json) =
      _$FlathubAppstreamAddonImpl.fromJson;

  @override
  @dList
  List<FlathubAppstreamRelease> get releases;
  @override
  FlathubAppstreamUrls? get urls;
  @override
  String? get icon;
  @override
  @dList
  List<FlathubAppstreamIcon> get icons;
  @override
  String get id;
  @override
  String? get name;
  @override
  String? get developerName;
  @override
  String? get summary;
  @override
  String? get projectLicense;
  @JsonKey(name: "extends")
  String get extendsApp;
  @override
  FlathubAppstreamBundle get bundle;
  @override
  FlathubAppstreamMetadata? get metadata;
  @override
  @dBool
  bool get isFreeLicense;
  @override
  String? get projectGroup;

  /// Create a copy of FlathubAppstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppstreamAddonImplCopyWith<_$FlathubAppstreamAddonImpl>
      get copyWith => throw _privateConstructorUsedError;
}
