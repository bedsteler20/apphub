// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlathubAppHit _$FlathubAppHitFromJson(Map<String, dynamic> json) {
  return _FlathubAppHit.fromJson(json);
}

/// @nodoc
mixin _$FlathubAppHit {
  String? get name => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  @dInt
  int get installsLastMonth => throw _privateConstructorUsedError;
  @dDou
  double get trending => throw _privateConstructorUsedError;
  @dList
  List<String> get keywords => throw _privateConstructorUsedError;
  String get appId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  @dList
  List<String> get categories => throw _privateConstructorUsedError;
  String? get developerName => throw _privateConstructorUsedError;
  String? get verificationMethod => throw _privateConstructorUsedError;
  String? get verificationLoginProvider => throw _privateConstructorUsedError;
  String? get verificationWebsite => throw _privateConstructorUsedError;
  String? get verificationTimestamp => throw _privateConstructorUsedError;
  String? get verificationLoginName => throw _privateConstructorUsedError;

  /// Serializes this FlathubAppHit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubAppHit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubAppHitCopyWith<FlathubAppHit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubAppHitCopyWith<$Res> {
  factory $FlathubAppHitCopyWith(
          FlathubAppHit value, $Res Function(FlathubAppHit) then) =
      _$FlathubAppHitCopyWithImpl<$Res, FlathubAppHit>;
  @useResult
  $Res call(
      {String? name,
      String? summary,
      @dInt int installsLastMonth,
      @dDou double trending,
      @dList List<String> keywords,
      String appId,
      String? description,
      String? icon,
      @dList List<String> categories,
      String? developerName,
      String? verificationMethod,
      String? verificationLoginProvider,
      String? verificationWebsite,
      String? verificationTimestamp,
      String? verificationLoginName});
}

/// @nodoc
class _$FlathubAppHitCopyWithImpl<$Res, $Val extends FlathubAppHit>
    implements $FlathubAppHitCopyWith<$Res> {
  _$FlathubAppHitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubAppHit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? summary = freezed,
    Object? installsLastMonth = null,
    Object? trending = null,
    Object? keywords = null,
    Object? appId = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? categories = null,
    Object? developerName = freezed,
    Object? verificationMethod = freezed,
    Object? verificationLoginProvider = freezed,
    Object? verificationWebsite = freezed,
    Object? verificationTimestamp = freezed,
    Object? verificationLoginName = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      installsLastMonth: null == installsLastMonth
          ? _value.installsLastMonth
          : installsLastMonth // ignore: cast_nullable_to_non_nullable
              as int,
      trending: null == trending
          ? _value.trending
          : trending // ignore: cast_nullable_to_non_nullable
              as double,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      developerName: freezed == developerName
          ? _value.developerName
          : developerName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginProvider: freezed == verificationLoginProvider
          ? _value.verificationLoginProvider
          : verificationLoginProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationWebsite: freezed == verificationWebsite
          ? _value.verificationWebsite
          : verificationWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationTimestamp: freezed == verificationTimestamp
          ? _value.verificationTimestamp
          : verificationTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginName: freezed == verificationLoginName
          ? _value.verificationLoginName
          : verificationLoginName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubAppHitImplCopyWith<$Res>
    implements $FlathubAppHitCopyWith<$Res> {
  factory _$$FlathubAppHitImplCopyWith(
          _$FlathubAppHitImpl value, $Res Function(_$FlathubAppHitImpl) then) =
      __$$FlathubAppHitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? summary,
      @dInt int installsLastMonth,
      @dDou double trending,
      @dList List<String> keywords,
      String appId,
      String? description,
      String? icon,
      @dList List<String> categories,
      String? developerName,
      String? verificationMethod,
      String? verificationLoginProvider,
      String? verificationWebsite,
      String? verificationTimestamp,
      String? verificationLoginName});
}

/// @nodoc
class __$$FlathubAppHitImplCopyWithImpl<$Res>
    extends _$FlathubAppHitCopyWithImpl<$Res, _$FlathubAppHitImpl>
    implements _$$FlathubAppHitImplCopyWith<$Res> {
  __$$FlathubAppHitImplCopyWithImpl(
      _$FlathubAppHitImpl _value, $Res Function(_$FlathubAppHitImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubAppHit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? summary = freezed,
    Object? installsLastMonth = null,
    Object? trending = null,
    Object? keywords = null,
    Object? appId = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? categories = null,
    Object? developerName = freezed,
    Object? verificationMethod = freezed,
    Object? verificationLoginProvider = freezed,
    Object? verificationWebsite = freezed,
    Object? verificationTimestamp = freezed,
    Object? verificationLoginName = freezed,
  }) {
    return _then(_$FlathubAppHitImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      installsLastMonth: null == installsLastMonth
          ? _value.installsLastMonth
          : installsLastMonth // ignore: cast_nullable_to_non_nullable
              as int,
      trending: null == trending
          ? _value.trending
          : trending // ignore: cast_nullable_to_non_nullable
              as double,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      developerName: freezed == developerName
          ? _value.developerName
          : developerName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginProvider: freezed == verificationLoginProvider
          ? _value.verificationLoginProvider
          : verificationLoginProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationWebsite: freezed == verificationWebsite
          ? _value.verificationWebsite
          : verificationWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationTimestamp: freezed == verificationTimestamp
          ? _value.verificationTimestamp
          : verificationTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLoginName: freezed == verificationLoginName
          ? _value.verificationLoginName
          : verificationLoginName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@snakeCase
class _$FlathubAppHitImpl implements _FlathubAppHit {
  const _$FlathubAppHitImpl(
      {this.name,
      this.summary,
      @dInt required this.installsLastMonth,
      @dDou required this.trending,
      @dList required final List<String> keywords,
      required this.appId,
      this.description,
      this.icon,
      @dList required final List<String> categories,
      this.developerName,
      this.verificationMethod,
      this.verificationLoginProvider,
      this.verificationWebsite,
      this.verificationTimestamp,
      this.verificationLoginName})
      : _keywords = keywords,
        _categories = categories;

  factory _$FlathubAppHitImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubAppHitImplFromJson(json);

  @override
  final String? name;
  @override
  final String? summary;
  @override
  @dInt
  final int installsLastMonth;
  @override
  @dDou
  final double trending;
  final List<String> _keywords;
  @override
  @dList
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  final String appId;
  @override
  final String? description;
  @override
  final String? icon;
  final List<String> _categories;
  @override
  @dList
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? developerName;
  @override
  final String? verificationMethod;
  @override
  final String? verificationLoginProvider;
  @override
  final String? verificationWebsite;
  @override
  final String? verificationTimestamp;
  @override
  final String? verificationLoginName;

  @override
  String toString() {
    return 'FlathubAppHit(name: $name, summary: $summary, installsLastMonth: $installsLastMonth, trending: $trending, keywords: $keywords, appId: $appId, description: $description, icon: $icon, categories: $categories, developerName: $developerName, verificationMethod: $verificationMethod, verificationLoginProvider: $verificationLoginProvider, verificationWebsite: $verificationWebsite, verificationTimestamp: $verificationTimestamp, verificationLoginName: $verificationLoginName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubAppHitImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.installsLastMonth, installsLastMonth) ||
                other.installsLastMonth == installsLastMonth) &&
            (identical(other.trending, trending) ||
                other.trending == trending) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.developerName, developerName) ||
                other.developerName == developerName) &&
            (identical(other.verificationMethod, verificationMethod) ||
                other.verificationMethod == verificationMethod) &&
            (identical(other.verificationLoginProvider,
                    verificationLoginProvider) ||
                other.verificationLoginProvider == verificationLoginProvider) &&
            (identical(other.verificationWebsite, verificationWebsite) ||
                other.verificationWebsite == verificationWebsite) &&
            (identical(other.verificationTimestamp, verificationTimestamp) ||
                other.verificationTimestamp == verificationTimestamp) &&
            (identical(other.verificationLoginName, verificationLoginName) ||
                other.verificationLoginName == verificationLoginName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      summary,
      installsLastMonth,
      trending,
      const DeepCollectionEquality().hash(_keywords),
      appId,
      description,
      icon,
      const DeepCollectionEquality().hash(_categories),
      developerName,
      verificationMethod,
      verificationLoginProvider,
      verificationWebsite,
      verificationTimestamp,
      verificationLoginName);

  /// Create a copy of FlathubAppHit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubAppHitImplCopyWith<_$FlathubAppHitImpl> get copyWith =>
      __$$FlathubAppHitImplCopyWithImpl<_$FlathubAppHitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubAppHitImplToJson(
      this,
    );
  }
}

abstract class _FlathubAppHit implements FlathubAppHit {
  const factory _FlathubAppHit(
      {final String? name,
      final String? summary,
      @dInt required final int installsLastMonth,
      @dDou required final double trending,
      @dList required final List<String> keywords,
      required final String appId,
      final String? description,
      final String? icon,
      @dList required final List<String> categories,
      final String? developerName,
      final String? verificationMethod,
      final String? verificationLoginProvider,
      final String? verificationWebsite,
      final String? verificationTimestamp,
      final String? verificationLoginName}) = _$FlathubAppHitImpl;

  factory _FlathubAppHit.fromJson(Map<String, dynamic> json) =
      _$FlathubAppHitImpl.fromJson;

  @override
  String? get name;
  @override
  String? get summary;
  @override
  @dInt
  int get installsLastMonth;
  @override
  @dDou
  double get trending;
  @override
  @dList
  List<String> get keywords;
  @override
  String get appId;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  @dList
  List<String> get categories;
  @override
  String? get developerName;
  @override
  String? get verificationMethod;
  @override
  String? get verificationLoginProvider;
  @override
  String? get verificationWebsite;
  @override
  String? get verificationTimestamp;
  @override
  String? get verificationLoginName;

  /// Create a copy of FlathubAppHit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubAppHitImplCopyWith<_$FlathubAppHitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlathubPagination _$FlathubPaginationFromJson(Map<String, dynamic> json) {
  return _FlathubPagination.fromJson(json);
}

/// @nodoc
mixin _$FlathubPagination {
  @dInt
  int get page => throw _privateConstructorUsedError;
  @dInt
  int get hitsPerPage => throw _privateConstructorUsedError;
  @dInt
  int get totalHits => throw _privateConstructorUsedError;
  @dInt
  int get totalPages => throw _privateConstructorUsedError;
  @dList
  List<FlathubAppHit> get hits => throw _privateConstructorUsedError;

  /// Serializes this FlathubPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlathubPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlathubPaginationCopyWith<FlathubPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlathubPaginationCopyWith<$Res> {
  factory $FlathubPaginationCopyWith(
          FlathubPagination value, $Res Function(FlathubPagination) then) =
      _$FlathubPaginationCopyWithImpl<$Res, FlathubPagination>;
  @useResult
  $Res call(
      {@dInt int page,
      @dInt int hitsPerPage,
      @dInt int totalHits,
      @dInt int totalPages,
      @dList List<FlathubAppHit> hits});
}

/// @nodoc
class _$FlathubPaginationCopyWithImpl<$Res, $Val extends FlathubPagination>
    implements $FlathubPaginationCopyWith<$Res> {
  _$FlathubPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlathubPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? hitsPerPage = null,
    Object? totalHits = null,
    Object? totalPages = null,
    Object? hits = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hitsPerPage: null == hitsPerPage
          ? _value.hitsPerPage
          : hitsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppHit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlathubPaginationImplCopyWith<$Res>
    implements $FlathubPaginationCopyWith<$Res> {
  factory _$$FlathubPaginationImplCopyWith(_$FlathubPaginationImpl value,
          $Res Function(_$FlathubPaginationImpl) then) =
      __$$FlathubPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@dInt int page,
      @dInt int hitsPerPage,
      @dInt int totalHits,
      @dInt int totalPages,
      @dList List<FlathubAppHit> hits});
}

/// @nodoc
class __$$FlathubPaginationImplCopyWithImpl<$Res>
    extends _$FlathubPaginationCopyWithImpl<$Res, _$FlathubPaginationImpl>
    implements _$$FlathubPaginationImplCopyWith<$Res> {
  __$$FlathubPaginationImplCopyWithImpl(_$FlathubPaginationImpl _value,
      $Res Function(_$FlathubPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlathubPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? hitsPerPage = null,
    Object? totalHits = null,
    Object? totalPages = null,
    Object? hits = null,
  }) {
    return _then(_$FlathubPaginationImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hitsPerPage: null == hitsPerPage
          ? _value.hitsPerPage
          : hitsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value._hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<FlathubAppHit>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlathubPaginationImpl implements _FlathubPagination {
  const _$FlathubPaginationImpl(
      {@dInt required this.page,
      @dInt required this.hitsPerPage,
      @dInt required this.totalHits,
      @dInt required this.totalPages,
      @dList required final List<FlathubAppHit> hits})
      : _hits = hits;

  factory _$FlathubPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlathubPaginationImplFromJson(json);

  @override
  @dInt
  final int page;
  @override
  @dInt
  final int hitsPerPage;
  @override
  @dInt
  final int totalHits;
  @override
  @dInt
  final int totalPages;
  final List<FlathubAppHit> _hits;
  @override
  @dList
  List<FlathubAppHit> get hits {
    if (_hits is EqualUnmodifiableListView) return _hits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hits);
  }

  @override
  String toString() {
    return 'FlathubPagination(page: $page, hitsPerPage: $hitsPerPage, totalHits: $totalHits, totalPages: $totalPages, hits: $hits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlathubPaginationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hitsPerPage, hitsPerPage) ||
                other.hitsPerPage == hitsPerPage) &&
            (identical(other.totalHits, totalHits) ||
                other.totalHits == totalHits) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._hits, _hits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, hitsPerPage, totalHits,
      totalPages, const DeepCollectionEquality().hash(_hits));

  /// Create a copy of FlathubPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlathubPaginationImplCopyWith<_$FlathubPaginationImpl> get copyWith =>
      __$$FlathubPaginationImplCopyWithImpl<_$FlathubPaginationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlathubPaginationImplToJson(
      this,
    );
  }
}

abstract class _FlathubPagination implements FlathubPagination {
  const factory _FlathubPagination(
          {@dInt required final int page,
          @dInt required final int hitsPerPage,
          @dInt required final int totalHits,
          @dInt required final int totalPages,
          @dList required final List<FlathubAppHit> hits}) =
      _$FlathubPaginationImpl;

  factory _FlathubPagination.fromJson(Map<String, dynamic> json) =
      _$FlathubPaginationImpl.fromJson;

  @override
  @dInt
  int get page;
  @override
  @dInt
  int get hitsPerPage;
  @override
  @dInt
  int get totalHits;
  @override
  @dInt
  int get totalPages;
  @override
  @dList
  List<FlathubAppHit> get hits;

  /// Create a copy of FlathubPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlathubPaginationImplCopyWith<_$FlathubPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
