// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlathubSummarySessionBus _$FlathubSummarySessionBusFromJson(
    Map<String, dynamic> json) {
  return _FlathubSummarySessionBus.fromJson(json);
}

/// @nodoc
mixin _$FlathubSummarySessionBus {
  @dList
  List<String> get talk => throw _privateConstructorUsedError;
  @dList
  List<String> get own => throw _privateConstructorUsedError;

  /// Serializes this FlathubSummarySessionBus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubSummarySessionBus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubSummarySessionBusCopyWith<FlathubSummarySessionBus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubSummarySessionBusCopyWith<$Res> {
  factory $FlathubSummarySessionBusCopyWith(FlathubSummarySessionBus value,
          $Res Function(FlathubSummarySessionBus) then) =
      _$FlathubSummarySessionBusCopyWithImpl<$Res, FlathubSummarySessionBus>;
  @useResult
  $Res call({@dList List<String> talk, @dList List<String> own});
}

/// @nodoc
class _$FlathubSummarySessionBusCopyWithImpl<$Res,
        $Val extends FlathubSummarySessionBus>
    implements $FlathubSummarySessionBusCopyWith<$Res> {
  _$FlathubSummarySessionBusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubSummarySessionBus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talk = null,
    Object? own = null,
  }) {
    return _then(_value.copyWith(
      talk: null == talk
          ? _value.talk
          : talk // ignore: cast_nullable_to_non_nullable
              as List<String>,
      own: null == own
          ? _value.own
          : own // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubSummarySessionBusImplCopyWith<$Res>
    implements $FlathubSummarySessionBusCopyWith<$Res> {
  factory _$$FlathubSummarySessionBusImplCopyWith(
          _$FlathubSummarySessionBusImpl value,
          $Res Function(_$FlathubSummarySessionBusImpl) then) =
      __$$FlathubSummarySessionBusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@dList List<String> talk, @dList List<String> own});
}

/// @nodoc
class __$$FlathubSummarySessionBusImplCopyWithImpl<$Res>
    extends _$FlathubSummarySessionBusCopyWithImpl<$Res,
        _$FlathubSummarySessionBusImpl>
    implements _$$FlathubSummarySessionBusImplCopyWith<$Res> {
  __$$FlathubSummarySessionBusImplCopyWithImpl(
      _$FlathubSummarySessionBusImpl _value,
      $Res Function(_$FlathubSummarySessionBusImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubSummarySessionBus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talk = null,
    Object? own = null,
  }) {
    return _then(_$FlathubSummarySessionBusImpl(
      talk: null == talk
          ? _value._talk
          : talk // ignore: cast_nullable_to_non_nullable
              as List<String>,
      own: null == own
          ? _value._own
          : own // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubSummarySessionBusImpl implements _FlathubSummarySessionBus {
  _$FlathubSummarySessionBusImpl(
      {@dList required final List<String> talk,
      @dList required final List<String> own})
      : _talk = talk,
        _own = own;

  factory _$FlathubSummarySessionBusImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubSummarySessionBusImplFromJson(json);

  final List<String> _talk;
  @override
  @dList
  List<String> get talk {
    if (_talk is EqualUnmodifiableListView) return _talk;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_talk);
  }

  final List<String> _own;
  @override
  @dList
  List<String> get own {
    if (_own is EqualUnmodifiableListView) return _own;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_own);
  }

  @override
  String toString() {
    return 'FlathubSummarySessionBus(talk: $talk, own: $own)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubSummarySessionBusImpl &&
            const DeepCollectionEquality().equals(other._talk, _talk) &&
            const DeepCollectionEquality().equals(other._own, _own));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_talk),
      const DeepCollectionEquality().hash(_own));

  /// Create a copy of FlathubSummarySessionBus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubSummarySessionBusImplCopyWith<_$FlathubSummarySessionBusImpl>
      get copyWith => __$$FlathubSummarySessionBusImplCopyWithImpl<
          _$FlathubSummarySessionBusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubSummarySessionBusImplToJson(
      this,
    );
  }
}

abstract class _FlathubSummarySessionBus implements FlathubSummarySessionBus {
  factory _FlathubSummarySessionBus(
      {@dList required final List<String> talk,
      @dList required final List<String> own}) = _$FlathubSummarySessionBusImpl;

  factory _FlathubSummarySessionBus.fromJson(Map<String, dynamic> json) =
      _$FlathubSummarySessionBusImpl.fromJson;

  @override
  @dList
  List<String> get talk;
  @override
  @dList
  List<String> get own;

  /// Create a copy of FlathubSummarySessionBus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubSummarySessionBusImplCopyWith<_$FlathubSummarySessionBusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubSummeryPermissions _$FlathubSummeryPermissionsFromJson(
    Map<String, dynamic> json) {
  return _FlathubSummeryPermissions.fromJson(json);
}

/// @nodoc
mixin _$FlathubSummeryPermissions {
  @dList
  List<String> get shared => throw _privateConstructorUsedError;
  @dList
  List<String> get sockets => throw _privateConstructorUsedError;
  @dList
  List<String> get devices => throw _privateConstructorUsedError;
  @dList
  List<String> get filesystems => throw _privateConstructorUsedError;
  FlathubSummarySessionBus? get sessionBus =>
      throw _privateConstructorUsedError;

  /// Serializes this FlathubSummeryPermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubSummeryPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubSummeryPermissionsCopyWith<FlathubSummeryPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubSummeryPermissionsCopyWith<$Res> {
  factory $FlathubSummeryPermissionsCopyWith(FlathubSummeryPermissions value,
          $Res Function(FlathubSummeryPermissions) then) =
      _$FlathubSummeryPermissionsCopyWithImpl<$Res, FlathubSummeryPermissions>;
  @useResult
  $Res call(
      {@dList List<String> shared,
      @dList List<String> sockets,
      @dList List<String> devices,
      @dList List<String> filesystems,
      FlathubSummarySessionBus? sessionBus});

  $FlathubSummarySessionBusCopyWith<$Res>? get sessionBus;
}

/// @nodoc
class _$FlathubSummeryPermissionsCopyWithImpl<$Res,
        $Val extends FlathubSummeryPermissions>
    implements $FlathubSummeryPermissionsCopyWith<$Res> {
  _$FlathubSummeryPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubSummeryPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shared = null,
    Object? sockets = null,
    Object? devices = null,
    Object? filesystems = null,
    Object? sessionBus = freezed,
  }) {
    return _then(_value.copyWith(
      shared: null == shared
          ? _value.shared
          : shared // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sockets: null == sockets
          ? _value.sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filesystems: null == filesystems
          ? _value.filesystems
          : filesystems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sessionBus: freezed == sessionBus
          ? _value.sessionBus
          : sessionBus // ignore: cast_nullable_to_non_nullable
              as FlathubSummarySessionBus?,
    ) as $Val);
  }

  /// Create a copy of FlathubSummeryPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubSummarySessionBusCopyWith<$Res>? get sessionBus {
    if (_value.sessionBus == null) {
      return null;
    }

    return $FlathubSummarySessionBusCopyWith<$Res>(_value.sessionBus!, (value) {
      return _then(_value.copyWith(sessionBus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlathubSummeryPermissionsImplCopyWith<$Res>
    implements $FlathubSummeryPermissionsCopyWith<$Res> {
  factory _$$FlathubSummeryPermissionsImplCopyWith(
          _$FlathubSummeryPermissionsImpl value,
          $Res Function(_$FlathubSummeryPermissionsImpl) then) =
      __$$FlathubSummeryPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@dList List<String> shared,
      @dList List<String> sockets,
      @dList List<String> devices,
      @dList List<String> filesystems,
      FlathubSummarySessionBus? sessionBus});

  @override
  $FlathubSummarySessionBusCopyWith<$Res>? get sessionBus;
}

/// @nodoc
class __$$FlathubSummeryPermissionsImplCopyWithImpl<$Res>
    extends _$FlathubSummeryPermissionsCopyWithImpl<$Res,
        _$FlathubSummeryPermissionsImpl>
    implements _$$FlathubSummeryPermissionsImplCopyWith<$Res> {
  __$$FlathubSummeryPermissionsImplCopyWithImpl(
      _$FlathubSummeryPermissionsImpl _value,
      $Res Function(_$FlathubSummeryPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubSummeryPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shared = null,
    Object? sockets = null,
    Object? devices = null,
    Object? filesystems = null,
    Object? sessionBus = freezed,
  }) {
    return _then(_$FlathubSummeryPermissionsImpl(
      shared: null == shared
          ? _value._shared
          : shared // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sockets: null == sockets
          ? _value._sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filesystems: null == filesystems
          ? _value._filesystems
          : filesystems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sessionBus: freezed == sessionBus
          ? _value.sessionBus
          : sessionBus // ignore: cast_nullable_to_non_nullable
              as FlathubSummarySessionBus?,
    ));
  }
}

/// @nodoc

@kebabCase
class _$FlathubSummeryPermissionsImpl implements _FlathubSummeryPermissions {
  _$FlathubSummeryPermissionsImpl(
      {@dList required final List<String> shared,
      @dList required final List<String> sockets,
      @dList required final List<String> devices,
      @dList required final List<String> filesystems,
      this.sessionBus})
      : _shared = shared,
        _sockets = sockets,
        _devices = devices,
        _filesystems = filesystems;

  factory _$FlathubSummeryPermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubSummeryPermissionsImplFromJson(json);

  final List<String> _shared;
  @override
  @dList
  List<String> get shared {
    if (_shared is EqualUnmodifiableListView) return _shared;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shared);
  }

  final List<String> _sockets;
  @override
  @dList
  List<String> get sockets {
    if (_sockets is EqualUnmodifiableListView) return _sockets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sockets);
  }

  final List<String> _devices;
  @override
  @dList
  List<String> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  final List<String> _filesystems;
  @override
  @dList
  List<String> get filesystems {
    if (_filesystems is EqualUnmodifiableListView) return _filesystems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filesystems);
  }

  @override
  final FlathubSummarySessionBus? sessionBus;

  @override
  String toString() {
    return 'FlathubSummeryPermissions(shared: $shared, sockets: $sockets, devices: $devices, filesystems: $filesystems, sessionBus: $sessionBus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubSummeryPermissionsImpl &&
            const DeepCollectionEquality().equals(other._shared, _shared) &&
            const DeepCollectionEquality().equals(other._sockets, _sockets) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            const DeepCollectionEquality()
                .equals(other._filesystems, _filesystems) &&
            (identical(other.sessionBus, sessionBus) ||
                other.sessionBus == sessionBus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_shared),
      const DeepCollectionEquality().hash(_sockets),
      const DeepCollectionEquality().hash(_devices),
      const DeepCollectionEquality().hash(_filesystems),
      sessionBus);

  /// Create a copy of FlathubSummeryPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubSummeryPermissionsImplCopyWith<_$FlathubSummeryPermissionsImpl>
      get copyWith => __$$FlathubSummeryPermissionsImplCopyWithImpl<
          _$FlathubSummeryPermissionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubSummeryPermissionsImplToJson(
      this,
    );
  }
}

abstract class _FlathubSummeryPermissions implements FlathubSummeryPermissions {
  factory _FlathubSummeryPermissions(
          {@dList required final List<String> shared,
          @dList required final List<String> sockets,
          @dList required final List<String> devices,
          @dList required final List<String> filesystems,
          final FlathubSummarySessionBus? sessionBus}) =
      _$FlathubSummeryPermissionsImpl;

  factory _FlathubSummeryPermissions.fromJson(Map<String, dynamic> json) =
      _$FlathubSummeryPermissionsImpl.fromJson;

  @override
  @dList
  List<String> get shared;
  @override
  @dList
  List<String> get sockets;
  @override
  @dList
  List<String> get devices;
  @override
  @dList
  List<String> get filesystems;
  @override
  FlathubSummarySessionBus? get sessionBus;

  /// Create a copy of FlathubSummeryPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubSummeryPermissionsImplCopyWith<_$FlathubSummeryPermissionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubSummeryExtension _$FlathubSummeryExtensionFromJson(
    Map<String, dynamic> json) {
  return _FlathubSummeryExtension.fromJson(json);
}

/// @nodoc
mixin _$FlathubSummeryExtension {
  String? get directory => throw _privateConstructorUsedError;
  bool? get autodelete => throw _privateConstructorUsedError;
  bool? get noAutoDownload => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get addLdPath => throw _privateConstructorUsedError;
  String? get mergeDirs => throw _privateConstructorUsedError;
  bool? get subdirectories => throw _privateConstructorUsedError;
  bool? get localeSubset => throw _privateConstructorUsedError;

  /// Serializes this FlathubSummeryExtension to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubSummeryExtension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubSummeryExtensionCopyWith<FlathubSummeryExtension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubSummeryExtensionCopyWith<$Res> {
  factory $FlathubSummeryExtensionCopyWith(FlathubSummeryExtension value,
          $Res Function(FlathubSummeryExtension) then) =
      _$FlathubSummeryExtensionCopyWithImpl<$Res, FlathubSummeryExtension>;
  @useResult
  $Res call(
      {String? directory,
      bool? autodelete,
      bool? noAutoDownload,
      String? version,
      String? addLdPath,
      String? mergeDirs,
      bool? subdirectories,
      bool? localeSubset});
}

/// @nodoc
class _$FlathubSummeryExtensionCopyWithImpl<$Res,
        $Val extends FlathubSummeryExtension>
    implements $FlathubSummeryExtensionCopyWith<$Res> {
  _$FlathubSummeryExtensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubSummeryExtension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directory = freezed,
    Object? autodelete = freezed,
    Object? noAutoDownload = freezed,
    Object? version = freezed,
    Object? addLdPath = freezed,
    Object? mergeDirs = freezed,
    Object? subdirectories = freezed,
    Object? localeSubset = freezed,
  }) {
    return _then(_value.copyWith(
      directory: freezed == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String?,
      autodelete: freezed == autodelete
          ? _value.autodelete
          : autodelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      noAutoDownload: freezed == noAutoDownload
          ? _value.noAutoDownload
          : noAutoDownload // ignore: cast_nullable_to_non_nullable
              as bool?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      addLdPath: freezed == addLdPath
          ? _value.addLdPath
          : addLdPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mergeDirs: freezed == mergeDirs
          ? _value.mergeDirs
          : mergeDirs // ignore: cast_nullable_to_non_nullable
              as String?,
      subdirectories: freezed == subdirectories
          ? _value.subdirectories
          : subdirectories // ignore: cast_nullable_to_non_nullable
              as bool?,
      localeSubset: freezed == localeSubset
          ? _value.localeSubset
          : localeSubset // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubSummeryExtensionImplCopyWith<$Res>
    implements $FlathubSummeryExtensionCopyWith<$Res> {
  factory _$$FlathubSummeryExtensionImplCopyWith(
          _$FlathubSummeryExtensionImpl value,
          $Res Function(_$FlathubSummeryExtensionImpl) then) =
      __$$FlathubSummeryExtensionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? directory,
      bool? autodelete,
      bool? noAutoDownload,
      String? version,
      String? addLdPath,
      String? mergeDirs,
      bool? subdirectories,
      bool? localeSubset});
}

/// @nodoc
class __$$FlathubSummeryExtensionImplCopyWithImpl<$Res>
    extends _$FlathubSummeryExtensionCopyWithImpl<$Res,
        _$FlathubSummeryExtensionImpl>
    implements _$$FlathubSummeryExtensionImplCopyWith<$Res> {
  __$$FlathubSummeryExtensionImplCopyWithImpl(
      _$FlathubSummeryExtensionImpl _value,
      $Res Function(_$FlathubSummeryExtensionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubSummeryExtension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directory = freezed,
    Object? autodelete = freezed,
    Object? noAutoDownload = freezed,
    Object? version = freezed,
    Object? addLdPath = freezed,
    Object? mergeDirs = freezed,
    Object? subdirectories = freezed,
    Object? localeSubset = freezed,
  }) {
    return _then(_$FlathubSummeryExtensionImpl(
      directory: freezed == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String?,
      autodelete: freezed == autodelete
          ? _value.autodelete
          : autodelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      noAutoDownload: freezed == noAutoDownload
          ? _value.noAutoDownload
          : noAutoDownload // ignore: cast_nullable_to_non_nullable
              as bool?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      addLdPath: freezed == addLdPath
          ? _value.addLdPath
          : addLdPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mergeDirs: freezed == mergeDirs
          ? _value.mergeDirs
          : mergeDirs // ignore: cast_nullable_to_non_nullable
              as String?,
      subdirectories: freezed == subdirectories
          ? _value.subdirectories
          : subdirectories // ignore: cast_nullable_to_non_nullable
              as bool?,
      localeSubset: freezed == localeSubset
          ? _value.localeSubset
          : localeSubset // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@kebabCase
@strToBool
class _$FlathubSummeryExtensionImpl implements _FlathubSummeryExtension {
  _$FlathubSummeryExtensionImpl(
      {this.directory,
      this.autodelete,
      this.noAutoDownload,
      this.version,
      this.addLdPath,
      this.mergeDirs,
      this.subdirectories,
      this.localeSubset});

  factory _$FlathubSummeryExtensionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubSummeryExtensionImplFromJson(json);

  @override
  final String? directory;
  @override
  final bool? autodelete;
  @override
  final bool? noAutoDownload;
  @override
  final String? version;
  @override
  final String? addLdPath;
  @override
  final String? mergeDirs;
  @override
  final bool? subdirectories;
  @override
  final bool? localeSubset;

  @override
  String toString() {
    return 'FlathubSummeryExtension(directory: $directory, autodelete: $autodelete, noAutoDownload: $noAutoDownload, version: $version, addLdPath: $addLdPath, mergeDirs: $mergeDirs, subdirectories: $subdirectories, localeSubset: $localeSubset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubSummeryExtensionImpl &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            (identical(other.autodelete, autodelete) ||
                other.autodelete == autodelete) &&
            (identical(other.noAutoDownload, noAutoDownload) ||
                other.noAutoDownload == noAutoDownload) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.addLdPath, addLdPath) ||
                other.addLdPath == addLdPath) &&
            (identical(other.mergeDirs, mergeDirs) ||
                other.mergeDirs == mergeDirs) &&
            (identical(other.subdirectories, subdirectories) ||
                other.subdirectories == subdirectories) &&
            (identical(other.localeSubset, localeSubset) ||
                other.localeSubset == localeSubset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      directory,
      autodelete,
      noAutoDownload,
      version,
      addLdPath,
      mergeDirs,
      subdirectories,
      localeSubset);

  /// Create a copy of FlathubSummeryExtension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubSummeryExtensionImplCopyWith<_$FlathubSummeryExtensionImpl>
      get copyWith => __$$FlathubSummeryExtensionImplCopyWithImpl<
          _$FlathubSummeryExtensionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubSummeryExtensionImplToJson(
      this,
    );
  }
}

abstract class _FlathubSummeryExtension implements FlathubSummeryExtension {
  factory _FlathubSummeryExtension(
      {final String? directory,
      final bool? autodelete,
      final bool? noAutoDownload,
      final String? version,
      final String? addLdPath,
      final String? mergeDirs,
      final bool? subdirectories,
      final bool? localeSubset}) = _$FlathubSummeryExtensionImpl;

  factory _FlathubSummeryExtension.fromJson(Map<String, dynamic> json) =
      _$FlathubSummeryExtensionImpl.fromJson;

  @override
  String? get directory;
  @override
  bool? get autodelete;
  @override
  bool? get noAutoDownload;
  @override
  String? get version;
  @override
  String? get addLdPath;
  @override
  String? get mergeDirs;
  @override
  bool? get subdirectories;
  @override
  bool? get localeSubset;

  /// Create a copy of FlathubSummeryExtension
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubSummeryExtensionImplCopyWith<_$FlathubSummeryExtensionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubSummeryExtraData _$FlathubSummeryExtraDataFromJson(
    Map<String, dynamic> json) {
  return _FlathubSummeryExtraData.fromJson(json);
}

/// @nodoc
mixin _$FlathubSummeryExtraData {
  String? get name => throw _privateConstructorUsedError;
  String? get checksum => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  String? get uri => throw _privateConstructorUsedError;

  /// Serializes this FlathubSummeryExtraData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubSummeryExtraData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubSummeryExtraDataCopyWith<FlathubSummeryExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubSummeryExtraDataCopyWith<$Res> {
  factory $FlathubSummeryExtraDataCopyWith(FlathubSummeryExtraData value,
          $Res Function(FlathubSummeryExtraData) then) =
      _$FlathubSummeryExtraDataCopyWithImpl<$Res, FlathubSummeryExtraData>;
  @useResult
  $Res call({String? name, String? checksum, String? size, String? uri});
}

/// @nodoc
class _$FlathubSummeryExtraDataCopyWithImpl<$Res,
        $Val extends FlathubSummeryExtraData>
    implements $FlathubSummeryExtraDataCopyWith<$Res> {
  _$FlathubSummeryExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubSummeryExtraData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? checksum = freezed,
    Object? size = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubSummeryExtraDataImplCopyWith<$Res>
    implements $FlathubSummeryExtraDataCopyWith<$Res> {
  factory _$$FlathubSummeryExtraDataImplCopyWith(
          _$FlathubSummeryExtraDataImpl value,
          $Res Function(_$FlathubSummeryExtraDataImpl) then) =
      __$$FlathubSummeryExtraDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? checksum, String? size, String? uri});
}

/// @nodoc
class __$$FlathubSummeryExtraDataImplCopyWithImpl<$Res>
    extends _$FlathubSummeryExtraDataCopyWithImpl<$Res,
        _$FlathubSummeryExtraDataImpl>
    implements _$$FlathubSummeryExtraDataImplCopyWith<$Res> {
  __$$FlathubSummeryExtraDataImplCopyWithImpl(
      _$FlathubSummeryExtraDataImpl _value,
      $Res Function(_$FlathubSummeryExtraDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubSummeryExtraData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? checksum = freezed,
    Object? size = freezed,
    Object? uri = freezed,
  }) {
    return _then(_$FlathubSummeryExtraDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubSummeryExtraDataImpl implements _FlathubSummeryExtraData {
  _$FlathubSummeryExtraDataImpl(
      {this.name, this.checksum, this.size, this.uri});

  factory _$FlathubSummeryExtraDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubSummeryExtraDataImplFromJson(json);

  @override
  final String? name;
  @override
  final String? checksum;
  @override
  final String? size;
  @override
  final String? uri;

  @override
  String toString() {
    return 'FlathubSummeryExtraData(name: $name, checksum: $checksum, size: $size, uri: $uri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubSummeryExtraDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, checksum, size, uri);

  /// Create a copy of FlathubSummeryExtraData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubSummeryExtraDataImplCopyWith<_$FlathubSummeryExtraDataImpl>
      get copyWith => __$$FlathubSummeryExtraDataImplCopyWithImpl<
          _$FlathubSummeryExtraDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubSummeryExtraDataImplToJson(
      this,
    );
  }
}

abstract class _FlathubSummeryExtraData implements FlathubSummeryExtraData {
  factory _FlathubSummeryExtraData(
      {final String? name,
      final String? checksum,
      final String? size,
      final String? uri}) = _$FlathubSummeryExtraDataImpl;

  factory _FlathubSummeryExtraData.fromJson(Map<String, dynamic> json) =
      _$FlathubSummeryExtraDataImpl.fromJson;

  @override
  String? get name;
  @override
  String? get checksum;
  @override
  String? get size;
  @override
  String? get uri;

  /// Create a copy of FlathubSummeryExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubSummeryExtraDataImplCopyWith<_$FlathubSummeryExtraDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubSummeryMetadata _$FlathubSummeryMetadataFromJson(
    Map<String, dynamic> json) {
  return _FlathubSummeryMetadata.fromJson(json);
}

/// @nodoc
mixin _$FlathubSummeryMetadata {
  String get name => throw _privateConstructorUsedError;
  String get sdk => throw _privateConstructorUsedError;
  String get runtime => throw _privateConstructorUsedError;
  FlathubSummeryPermissions get permissions =>
      throw _privateConstructorUsedError;
  String? get requiredFlatpak => throw _privateConstructorUsedError;
  @dList
  List<String> get tags => throw _privateConstructorUsedError;
  @dMap
  Map<String, FlathubSummeryExtension> get extensions =>
      throw _privateConstructorUsedError;
  @dList
  List<String> get builtExtensions => throw _privateConstructorUsedError;
  @dBool
  bool get runtimeIsEol => throw _privateConstructorUsedError;
  FlathubSummeryExtraData? get extraData => throw _privateConstructorUsedError;

  /// Serializes this FlathubSummeryMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubSummeryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubSummeryMetadataCopyWith<FlathubSummeryMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubSummeryMetadataCopyWith<$Res> {
  factory $FlathubSummeryMetadataCopyWith(FlathubSummeryMetadata value,
          $Res Function(FlathubSummeryMetadata) then) =
      _$FlathubSummeryMetadataCopyWithImpl<$Res, FlathubSummeryMetadata>;
  @useResult
  $Res call(
      {String name,
      String sdk,
      String runtime,
      FlathubSummeryPermissions permissions,
      String? requiredFlatpak,
      @dList List<String> tags,
      @dMap Map<String, FlathubSummeryExtension> extensions,
      @dList List<String> builtExtensions,
      @dBool bool runtimeIsEol,
      FlathubSummeryExtraData? extraData});

  $FlathubSummeryPermissionsCopyWith<$Res> get permissions;
  $FlathubSummeryExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class _$FlathubSummeryMetadataCopyWithImpl<$Res,
        $Val extends FlathubSummeryMetadata>
    implements $FlathubSummeryMetadataCopyWith<$Res> {
  _$FlathubSummeryMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubSummeryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sdk = null,
    Object? runtime = null,
    Object? permissions = null,
    Object? requiredFlatpak = freezed,
    Object? tags = null,
    Object? extensions = null,
    Object? builtExtensions = null,
    Object? runtimeIsEol = null,
    Object? extraData = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sdk: null == sdk
          ? _value.sdk
          : sdk // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as FlathubSummeryPermissions,
      requiredFlatpak: freezed == requiredFlatpak
          ? _value.requiredFlatpak
          : requiredFlatpak // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as Map<String, FlathubSummeryExtension>,
      builtExtensions: null == builtExtensions
          ? _value.builtExtensions
          : builtExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      runtimeIsEol: null == runtimeIsEol
          ? _value.runtimeIsEol
          : runtimeIsEol // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as FlathubSummeryExtraData?,
    ) as $Val);
  }

  /// Create a copy of FlathubSummeryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubSummeryPermissionsCopyWith<$Res> get permissions {
    return $FlathubSummeryPermissionsCopyWith<$Res>(_value.permissions,
        (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }

  /// Create a copy of FlathubSummeryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubSummeryExtraDataCopyWith<$Res>? get extraData {
    if (_value.extraData == null) {
      return null;
    }

    return $FlathubSummeryExtraDataCopyWith<$Res>(_value.extraData!, (value) {
      return _then(_value.copyWith(extraData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlathubSummeryMetadataImplCopyWith<$Res>
    implements $FlathubSummeryMetadataCopyWith<$Res> {
  factory _$$FlathubSummeryMetadataImplCopyWith(
          _$FlathubSummeryMetadataImpl value,
          $Res Function(_$FlathubSummeryMetadataImpl) then) =
      __$$FlathubSummeryMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String sdk,
      String runtime,
      FlathubSummeryPermissions permissions,
      String? requiredFlatpak,
      @dList List<String> tags,
      @dMap Map<String, FlathubSummeryExtension> extensions,
      @dList List<String> builtExtensions,
      @dBool bool runtimeIsEol,
      FlathubSummeryExtraData? extraData});

  @override
  $FlathubSummeryPermissionsCopyWith<$Res> get permissions;
  @override
  $FlathubSummeryExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class __$$FlathubSummeryMetadataImplCopyWithImpl<$Res>
    extends _$FlathubSummeryMetadataCopyWithImpl<$Res,
        _$FlathubSummeryMetadataImpl>
    implements _$$FlathubSummeryMetadataImplCopyWith<$Res> {
  __$$FlathubSummeryMetadataImplCopyWithImpl(
      _$FlathubSummeryMetadataImpl _value,
      $Res Function(_$FlathubSummeryMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubSummeryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sdk = null,
    Object? runtime = null,
    Object? permissions = null,
    Object? requiredFlatpak = freezed,
    Object? tags = null,
    Object? extensions = null,
    Object? builtExtensions = null,
    Object? runtimeIsEol = null,
    Object? extraData = freezed,
  }) {
    return _then(_$FlathubSummeryMetadataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sdk: null == sdk
          ? _value.sdk
          : sdk // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as FlathubSummeryPermissions,
      requiredFlatpak: freezed == requiredFlatpak
          ? _value.requiredFlatpak
          : requiredFlatpak // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      extensions: null == extensions
          ? _value._extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as Map<String, FlathubSummeryExtension>,
      builtExtensions: null == builtExtensions
          ? _value._builtExtensions
          : builtExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      runtimeIsEol: null == runtimeIsEol
          ? _value.runtimeIsEol
          : runtimeIsEol // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as FlathubSummeryExtraData?,
    ));
  }
}

/// @nodoc

@kebabCase
class _$FlathubSummeryMetadataImpl implements _FlathubSummeryMetadata {
  _$FlathubSummeryMetadataImpl(
      {required this.name,
      required this.sdk,
      required this.runtime,
      required this.permissions,
      this.requiredFlatpak,
      @dList required final List<String> tags,
      @dMap required final Map<String, FlathubSummeryExtension> extensions,
      @dList required final List<String> builtExtensions,
      @dBool required this.runtimeIsEol,
      this.extraData})
      : _tags = tags,
        _extensions = extensions,
        _builtExtensions = builtExtensions;

  factory _$FlathubSummeryMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubSummeryMetadataImplFromJson(json);

  @override
  final String name;
  @override
  final String sdk;
  @override
  final String runtime;
  @override
  final FlathubSummeryPermissions permissions;
  @override
  final String? requiredFlatpak;
  final List<String> _tags;
  @override
  @dList
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final Map<String, FlathubSummeryExtension> _extensions;
  @override
  @dMap
  Map<String, FlathubSummeryExtension> get extensions {
    if (_extensions is EqualUnmodifiableMapView) return _extensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extensions);
  }

  final List<String> _builtExtensions;
  @override
  @dList
  List<String> get builtExtensions {
    if (_builtExtensions is EqualUnmodifiableListView) return _builtExtensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_builtExtensions);
  }

  @override
  @dBool
  final bool runtimeIsEol;
  @override
  final FlathubSummeryExtraData? extraData;

  @override
  String toString() {
    return 'FlathubSummeryMetadata(name: $name, sdk: $sdk, runtime: $runtime, permissions: $permissions, requiredFlatpak: $requiredFlatpak, tags: $tags, extensions: $extensions, builtExtensions: $builtExtensions, runtimeIsEol: $runtimeIsEol, extraData: $extraData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubSummeryMetadataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sdk, sdk) || other.sdk == sdk) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.requiredFlatpak, requiredFlatpak) ||
                other.requiredFlatpak == requiredFlatpak) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._extensions, _extensions) &&
            const DeepCollectionEquality()
                .equals(other._builtExtensions, _builtExtensions) &&
            (identical(other.runtimeIsEol, runtimeIsEol) ||
                other.runtimeIsEol == runtimeIsEol) &&
            (identical(other.extraData, extraData) ||
                other.extraData == extraData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      sdk,
      runtime,
      permissions,
      requiredFlatpak,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_extensions),
      const DeepCollectionEquality().hash(_builtExtensions),
      runtimeIsEol,
      extraData);

  /// Create a copy of FlathubSummeryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubSummeryMetadataImplCopyWith<_$FlathubSummeryMetadataImpl>
      get copyWith => __$$FlathubSummeryMetadataImplCopyWithImpl<
          _$FlathubSummeryMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubSummeryMetadataImplToJson(
      this,
    );
  }
}

abstract class _FlathubSummeryMetadata implements FlathubSummeryMetadata {
  factory _FlathubSummeryMetadata(
      {required final String name,
      required final String sdk,
      required final String runtime,
      required final FlathubSummeryPermissions permissions,
      final String? requiredFlatpak,
      @dList required final List<String> tags,
      @dMap required final Map<String, FlathubSummeryExtension> extensions,
      @dList required final List<String> builtExtensions,
      @dBool required final bool runtimeIsEol,
      final FlathubSummeryExtraData? extraData}) = _$FlathubSummeryMetadataImpl;

  factory _FlathubSummeryMetadata.fromJson(Map<String, dynamic> json) =
      _$FlathubSummeryMetadataImpl.fromJson;

  @override
  String get name;
  @override
  String get sdk;
  @override
  String get runtime;
  @override
  FlathubSummeryPermissions get permissions;
  @override
  String? get requiredFlatpak;
  @override
  @dList
  List<String> get tags;
  @override
  @dMap
  Map<String, FlathubSummeryExtension> get extensions;
  @override
  @dList
  List<String> get builtExtensions;
  @override
  @dBool
  bool get runtimeIsEol;
  @override
  FlathubSummeryExtraData? get extraData;

  /// Create a copy of FlathubSummeryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubSummeryMetadataImplCopyWith<_$FlathubSummeryMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlathubSummary _$FlathubSummaryFromJson(Map<String, dynamic> json) {
  return _FlathubSummary.fromJson(json);
}

/// @nodoc
mixin _$FlathubSummary {
  @dList
  List<String> get arches => throw _privateConstructorUsedError;
  @dInt
  int get timestamp => throw _privateConstructorUsedError;
  @dInt
  int get downloadSize => throw _privateConstructorUsedError;
  @dInt
  int get installedSize => throw _privateConstructorUsedError;
  String get branch => throw _privateConstructorUsedError;
  FlathubSummeryMetadata? get metadata => throw _privateConstructorUsedError;

  /// Serializes this FlathubSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubSummaryCopyWith<FlathubSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubSummaryCopyWith<$Res> {
  factory $FlathubSummaryCopyWith(
          FlathubSummary value, $Res Function(FlathubSummary) then) =
      _$FlathubSummaryCopyWithImpl<$Res, FlathubSummary>;
  @useResult
  $Res call(
      {@dList List<String> arches,
      @dInt int timestamp,
      @dInt int downloadSize,
      @dInt int installedSize,
      String branch,
      FlathubSummeryMetadata? metadata});

  $FlathubSummeryMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$FlathubSummaryCopyWithImpl<$Res, $Val extends FlathubSummary>
    implements $FlathubSummaryCopyWith<$Res> {
  _$FlathubSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arches = null,
    Object? timestamp = null,
    Object? downloadSize = null,
    Object? installedSize = null,
    Object? branch = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      arches: null == arches
          ? _value.arches
          : arches // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      downloadSize: null == downloadSize
          ? _value.downloadSize
          : downloadSize // ignore: cast_nullable_to_non_nullable
              as int,
      installedSize: null == installedSize
          ? _value.installedSize
          : installedSize // ignore: cast_nullable_to_non_nullable
              as int,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FlathubSummeryMetadata?,
    ) as $Val);
  }

  /// Create a copy of FlathubSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlathubSummeryMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $FlathubSummeryMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlathubSummaryImplCopyWith<$Res>
    implements $FlathubSummaryCopyWith<$Res> {
  factory _$$FlathubSummaryImplCopyWith(_$FlathubSummaryImpl value,
          $Res Function(_$FlathubSummaryImpl) then) =
      __$$FlathubSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@dList List<String> arches,
      @dInt int timestamp,
      @dInt int downloadSize,
      @dInt int installedSize,
      String branch,
      FlathubSummeryMetadata? metadata});

  @override
  $FlathubSummeryMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$FlathubSummaryImplCopyWithImpl<$Res>
    extends _$FlathubSummaryCopyWithImpl<$Res, _$FlathubSummaryImpl>
    implements _$$FlathubSummaryImplCopyWith<$Res> {
  __$$FlathubSummaryImplCopyWithImpl(
      _$FlathubSummaryImpl _value, $Res Function(_$FlathubSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arches = null,
    Object? timestamp = null,
    Object? downloadSize = null,
    Object? installedSize = null,
    Object? branch = null,
    Object? metadata = freezed,
  }) {
    return _then(_$FlathubSummaryImpl(
      arches: null == arches
          ? _value._arches
          : arches // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      downloadSize: null == downloadSize
          ? _value.downloadSize
          : downloadSize // ignore: cast_nullable_to_non_nullable
              as int,
      installedSize: null == installedSize
          ? _value.installedSize
          : installedSize // ignore: cast_nullable_to_non_nullable
              as int,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FlathubSummeryMetadata?,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubSummaryImpl implements _FlathubSummary {
  _$FlathubSummaryImpl(
      {@dList required final List<String> arches,
      @dInt required this.timestamp,
      @dInt required this.downloadSize,
      @dInt required this.installedSize,
      required this.branch,
      this.metadata})
      : _arches = arches;

  factory _$FlathubSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubSummaryImplFromJson(json);

  final List<String> _arches;
  @override
  @dList
  List<String> get arches {
    if (_arches is EqualUnmodifiableListView) return _arches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_arches);
  }

  @override
  @dInt
  final int timestamp;
  @override
  @dInt
  final int downloadSize;
  @override
  @dInt
  final int installedSize;
  @override
  final String branch;
  @override
  final FlathubSummeryMetadata? metadata;

  @override
  String toString() {
    return 'FlathubSummary(arches: $arches, timestamp: $timestamp, downloadSize: $downloadSize, installedSize: $installedSize, branch: $branch, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubSummaryImpl &&
            const DeepCollectionEquality().equals(other._arches, _arches) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.downloadSize, downloadSize) ||
                other.downloadSize == downloadSize) &&
            (identical(other.installedSize, installedSize) ||
                other.installedSize == installedSize) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_arches),
      timestamp,
      downloadSize,
      installedSize,
      branch,
      metadata);

  /// Create a copy of FlathubSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubSummaryImplCopyWith<_$FlathubSummaryImpl> get copyWith =>
      __$$FlathubSummaryImplCopyWithImpl<_$FlathubSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubSummaryImplToJson(
      this,
    );
  }
}

abstract class _FlathubSummary implements FlathubSummary {
  factory _FlathubSummary(
      {@dList required final List<String> arches,
      @dInt required final int timestamp,
      @dInt required final int downloadSize,
      @dInt required final int installedSize,
      required final String branch,
      final FlathubSummeryMetadata? metadata}) = _$FlathubSummaryImpl;

  factory _FlathubSummary.fromJson(Map<String, dynamic> json) =
      _$FlathubSummaryImpl.fromJson;

  @override
  @dList
  List<String> get arches;
  @override
  @dInt
  int get timestamp;
  @override
  @dInt
  int get downloadSize;
  @override
  @dInt
  int get installedSize;
  @override
  String get branch;
  @override
  FlathubSummeryMetadata? get metadata;

  /// Create a copy of FlathubSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubSummaryImplCopyWith<_$FlathubSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
