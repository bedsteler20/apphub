// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'02ba86bea8c151426e35027eec85049cbf84407b';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$flathubClientHash() => r'61ed91996a96e15ffba7a63488d122ef89687c50';

/// See also [flathubClient].
@ProviderFor(flathubClient)
final flathubClientProvider = AutoDisposeProvider<FlathubClient>.internal(
  flathubClient,
  name: r'flathubClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flathubClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FlathubClientRef = AutoDisposeProviderRef<FlathubClient>;
String _$appstreamHash() => r'dbdcb94f595c0c2dace6505d62be43f2676a23a0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [appstream].
@ProviderFor(appstream)
const appstreamProvider = AppstreamFamily();

/// See also [appstream].
class AppstreamFamily extends Family<AsyncValue<FlathubAppstream>> {
  /// See also [appstream].
  const AppstreamFamily();

  /// See also [appstream].
  AppstreamProvider call(
    String appId,
  ) {
    return AppstreamProvider(
      appId,
    );
  }

  @override
  AppstreamProvider getProviderOverride(
    covariant AppstreamProvider provider,
  ) {
    return call(
      provider.appId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appstreamProvider';
}

/// See also [appstream].
class AppstreamProvider extends AutoDisposeFutureProvider<FlathubAppstream> {
  /// See also [appstream].
  AppstreamProvider(
    String appId,
  ) : this._internal(
          (ref) => appstream(
            ref as AppstreamRef,
            appId,
          ),
          from: appstreamProvider,
          name: r'appstreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appstreamHash,
          dependencies: AppstreamFamily._dependencies,
          allTransitiveDependencies: AppstreamFamily._allTransitiveDependencies,
          appId: appId,
        );

  AppstreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
  }) : super.internal();

  final String appId;

  @override
  Override overrideWith(
    FutureOr<FlathubAppstream> Function(AppstreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppstreamProvider._internal(
        (ref) => create(ref as AppstreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appId: appId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubAppstream> createElement() {
    return _AppstreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppstreamProvider && other.appId == appId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppstreamRef on AutoDisposeFutureProviderRef<FlathubAppstream> {
  /// The parameter `appId` of this provider.
  String get appId;
}

class _AppstreamProviderElement
    extends AutoDisposeFutureProviderElement<FlathubAppstream>
    with AppstreamRef {
  _AppstreamProviderElement(super.provider);

  @override
  String get appId => (origin as AppstreamProvider).appId;
}

String _$summaryHash() => r'0c39aa703d89992621bc9c034b645abf287d51e7';

/// See also [summary].
@ProviderFor(summary)
const summaryProvider = SummaryFamily();

/// See also [summary].
class SummaryFamily extends Family<AsyncValue<FlathubSummary>> {
  /// See also [summary].
  const SummaryFamily();

  /// See also [summary].
  SummaryProvider call(
    String appId,
  ) {
    return SummaryProvider(
      appId,
    );
  }

  @override
  SummaryProvider getProviderOverride(
    covariant SummaryProvider provider,
  ) {
    return call(
      provider.appId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'summaryProvider';
}

/// See also [summary].
class SummaryProvider extends AutoDisposeFutureProvider<FlathubSummary> {
  /// See also [summary].
  SummaryProvider(
    String appId,
  ) : this._internal(
          (ref) => summary(
            ref as SummaryRef,
            appId,
          ),
          from: summaryProvider,
          name: r'summaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$summaryHash,
          dependencies: SummaryFamily._dependencies,
          allTransitiveDependencies: SummaryFamily._allTransitiveDependencies,
          appId: appId,
        );

  SummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
  }) : super.internal();

  final String appId;

  @override
  Override overrideWith(
    FutureOr<FlathubSummary> Function(SummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SummaryProvider._internal(
        (ref) => create(ref as SummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appId: appId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubSummary> createElement() {
    return _SummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SummaryProvider && other.appId == appId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SummaryRef on AutoDisposeFutureProviderRef<FlathubSummary> {
  /// The parameter `appId` of this provider.
  String get appId;
}

class _SummaryProviderElement
    extends AutoDisposeFutureProviderElement<FlathubSummary> with SummaryRef {
  _SummaryProviderElement(super.provider);

  @override
  String get appId => (origin as SummaryProvider).appId;
}

String _$developerHash() => r'b197bcc7c3cf2df2891a16a4f0c0020484215c35';

/// See also [developer].
@ProviderFor(developer)
const developerProvider = DeveloperFamily();

/// See also [developer].
class DeveloperFamily extends Family<AsyncValue<FlathubPagination>> {
  /// See also [developer].
  const DeveloperFamily();

  /// See also [developer].
  DeveloperProvider call(
    String developerName, {
    int page = 1,
    int pageSize = 50,
  }) {
    return DeveloperProvider(
      developerName,
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  DeveloperProvider getProviderOverride(
    covariant DeveloperProvider provider,
  ) {
    return call(
      provider.developerName,
      page: provider.page,
      pageSize: provider.pageSize,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'developerProvider';
}

/// See also [developer].
class DeveloperProvider extends AutoDisposeFutureProvider<FlathubPagination> {
  /// See also [developer].
  DeveloperProvider(
    String developerName, {
    int page = 1,
    int pageSize = 50,
  }) : this._internal(
          (ref) => developer(
            ref as DeveloperRef,
            developerName,
            page: page,
            pageSize: pageSize,
          ),
          from: developerProvider,
          name: r'developerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$developerHash,
          dependencies: DeveloperFamily._dependencies,
          allTransitiveDependencies: DeveloperFamily._allTransitiveDependencies,
          developerName: developerName,
          page: page,
          pageSize: pageSize,
        );

  DeveloperProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.developerName,
    required this.page,
    required this.pageSize,
  }) : super.internal();

  final String developerName;
  final int page;
  final int pageSize;

  @override
  Override overrideWith(
    FutureOr<FlathubPagination> Function(DeveloperRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeveloperProvider._internal(
        (ref) => create(ref as DeveloperRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        developerName: developerName,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubPagination> createElement() {
    return _DeveloperProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeveloperProvider &&
        other.developerName == developerName &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, developerName.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeveloperRef on AutoDisposeFutureProviderRef<FlathubPagination> {
  /// The parameter `developerName` of this provider.
  String get developerName;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;
}

class _DeveloperProviderElement
    extends AutoDisposeFutureProviderElement<FlathubPagination>
    with DeveloperRef {
  _DeveloperProviderElement(super.provider);

  @override
  String get developerName => (origin as DeveloperProvider).developerName;
  @override
  int get page => (origin as DeveloperProvider).page;
  @override
  int get pageSize => (origin as DeveloperProvider).pageSize;
}

String _$appsOfTheWeekHash() => r'1c2b9035ad54e9ac4cf27fa9a8e94f9917d7031b';

/// See also [appsOfTheWeek].
@ProviderFor(appsOfTheWeek)
final appsOfTheWeekProvider =
    AutoDisposeFutureProvider<List<FlathubAppstream>>.internal(
  appsOfTheWeek,
  name: r'appsOfTheWeekProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appsOfTheWeekHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppsOfTheWeekRef = AutoDisposeFutureProviderRef<List<FlathubAppstream>>;
String _$circleAppOfTheDayHash() => r'd88cef80b42604efa8287edf9743b9d0dff02e10';

/// See also [circleAppOfTheDay].
@ProviderFor(circleAppOfTheDay)
final circleAppOfTheDayProvider =
    AutoDisposeFutureProvider<RecommendedApp>.internal(
  circleAppOfTheDay,
  name: r'circleAppOfTheDayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$circleAppOfTheDayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CircleAppOfTheDayRef = AutoDisposeFutureProviderRef<RecommendedApp>;
String _$appOfTheDayHash() => r'5c2d73388dba416128548372702b764cfcf1d29c';

/// See also [appOfTheDay].
@ProviderFor(appOfTheDay)
final appOfTheDayProvider =
    AutoDisposeFutureProvider<FlathubAppstream>.internal(
  appOfTheDay,
  name: r'appOfTheDayProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appOfTheDayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppOfTheDayRef = AutoDisposeFutureProviderRef<FlathubAppstream>;
String _$trendingAppsHash() => r'adefec100ba380dff94baa562ad6e9a833f68fb4';

/// See also [trendingApps].
@ProviderFor(trendingApps)
const trendingAppsProvider = TrendingAppsFamily();

/// See also [trendingApps].
class TrendingAppsFamily extends Family<AsyncValue<FlathubPagination>> {
  /// See also [trendingApps].
  const TrendingAppsFamily();

  /// See also [trendingApps].
  TrendingAppsProvider call({
    int page = 1,
    int pageSize = 50,
  }) {
    return TrendingAppsProvider(
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  TrendingAppsProvider getProviderOverride(
    covariant TrendingAppsProvider provider,
  ) {
    return call(
      page: provider.page,
      pageSize: provider.pageSize,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trendingAppsProvider';
}

/// See also [trendingApps].
class TrendingAppsProvider
    extends AutoDisposeFutureProvider<FlathubPagination> {
  /// See also [trendingApps].
  TrendingAppsProvider({
    int page = 1,
    int pageSize = 50,
  }) : this._internal(
          (ref) => trendingApps(
            ref as TrendingAppsRef,
            page: page,
            pageSize: pageSize,
          ),
          from: trendingAppsProvider,
          name: r'trendingAppsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trendingAppsHash,
          dependencies: TrendingAppsFamily._dependencies,
          allTransitiveDependencies:
              TrendingAppsFamily._allTransitiveDependencies,
          page: page,
          pageSize: pageSize,
        );

  TrendingAppsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.pageSize,
  }) : super.internal();

  final int page;
  final int pageSize;

  @override
  Override overrideWith(
    FutureOr<FlathubPagination> Function(TrendingAppsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrendingAppsProvider._internal(
        (ref) => create(ref as TrendingAppsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubPagination> createElement() {
    return _TrendingAppsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrendingAppsProvider &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TrendingAppsRef on AutoDisposeFutureProviderRef<FlathubPagination> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;
}

class _TrendingAppsProviderElement
    extends AutoDisposeFutureProviderElement<FlathubPagination>
    with TrendingAppsRef {
  _TrendingAppsProviderElement(super.provider);

  @override
  int get page => (origin as TrendingAppsProvider).page;
  @override
  int get pageSize => (origin as TrendingAppsProvider).pageSize;
}

String _$popularAppsHash() => r'e698f3cd72d9bef9b08dcbcfffe247bb4c096a19';

/// See also [popularApps].
@ProviderFor(popularApps)
const popularAppsProvider = PopularAppsFamily();

/// See also [popularApps].
class PopularAppsFamily extends Family<AsyncValue<FlathubPagination>> {
  /// See also [popularApps].
  const PopularAppsFamily();

  /// See also [popularApps].
  PopularAppsProvider call({
    int page = 1,
    int pageSize = 50,
  }) {
    return PopularAppsProvider(
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  PopularAppsProvider getProviderOverride(
    covariant PopularAppsProvider provider,
  ) {
    return call(
      page: provider.page,
      pageSize: provider.pageSize,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'popularAppsProvider';
}

/// See also [popularApps].
class PopularAppsProvider extends AutoDisposeFutureProvider<FlathubPagination> {
  /// See also [popularApps].
  PopularAppsProvider({
    int page = 1,
    int pageSize = 50,
  }) : this._internal(
          (ref) => popularApps(
            ref as PopularAppsRef,
            page: page,
            pageSize: pageSize,
          ),
          from: popularAppsProvider,
          name: r'popularAppsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$popularAppsHash,
          dependencies: PopularAppsFamily._dependencies,
          allTransitiveDependencies:
              PopularAppsFamily._allTransitiveDependencies,
          page: page,
          pageSize: pageSize,
        );

  PopularAppsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.pageSize,
  }) : super.internal();

  final int page;
  final int pageSize;

  @override
  Override overrideWith(
    FutureOr<FlathubPagination> Function(PopularAppsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PopularAppsProvider._internal(
        (ref) => create(ref as PopularAppsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubPagination> createElement() {
    return _PopularAppsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PopularAppsProvider &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PopularAppsRef on AutoDisposeFutureProviderRef<FlathubPagination> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;
}

class _PopularAppsProviderElement
    extends AutoDisposeFutureProviderElement<FlathubPagination>
    with PopularAppsRef {
  _PopularAppsProviderElement(super.provider);

  @override
  int get page => (origin as PopularAppsProvider).page;
  @override
  int get pageSize => (origin as PopularAppsProvider).pageSize;
}

String _$newAppsHash() => r'c9f7ca4352818d854085b732e04a928afc7296cc';

/// See also [newApps].
@ProviderFor(newApps)
const newAppsProvider = NewAppsFamily();

/// See also [newApps].
class NewAppsFamily extends Family<AsyncValue<FlathubPagination>> {
  /// See also [newApps].
  const NewAppsFamily();

  /// See also [newApps].
  NewAppsProvider call({
    int page = 1,
    int pageSize = 50,
  }) {
    return NewAppsProvider(
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  NewAppsProvider getProviderOverride(
    covariant NewAppsProvider provider,
  ) {
    return call(
      page: provider.page,
      pageSize: provider.pageSize,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newAppsProvider';
}

/// See also [newApps].
class NewAppsProvider extends AutoDisposeFutureProvider<FlathubPagination> {
  /// See also [newApps].
  NewAppsProvider({
    int page = 1,
    int pageSize = 50,
  }) : this._internal(
          (ref) => newApps(
            ref as NewAppsRef,
            page: page,
            pageSize: pageSize,
          ),
          from: newAppsProvider,
          name: r'newAppsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newAppsHash,
          dependencies: NewAppsFamily._dependencies,
          allTransitiveDependencies: NewAppsFamily._allTransitiveDependencies,
          page: page,
          pageSize: pageSize,
        );

  NewAppsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.pageSize,
  }) : super.internal();

  final int page;
  final int pageSize;

  @override
  Override overrideWith(
    FutureOr<FlathubPagination> Function(NewAppsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewAppsProvider._internal(
        (ref) => create(ref as NewAppsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubPagination> createElement() {
    return _NewAppsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewAppsProvider &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NewAppsRef on AutoDisposeFutureProviderRef<FlathubPagination> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;
}

class _NewAppsProviderElement
    extends AutoDisposeFutureProviderElement<FlathubPagination>
    with NewAppsRef {
  _NewAppsProviderElement(super.provider);

  @override
  int get page => (origin as NewAppsProvider).page;
  @override
  int get pageSize => (origin as NewAppsProvider).pageSize;
}

String _$updatedAppsHash() => r'1107ca7cbf3e5e48f914342c20a4357dbc9506e9';

/// See also [updatedApps].
@ProviderFor(updatedApps)
const updatedAppsProvider = UpdatedAppsFamily();

/// See also [updatedApps].
class UpdatedAppsFamily extends Family<AsyncValue<FlathubPagination>> {
  /// See also [updatedApps].
  const UpdatedAppsFamily();

  /// See also [updatedApps].
  UpdatedAppsProvider call({
    int page = 1,
    int pageSize = 50,
  }) {
    return UpdatedAppsProvider(
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  UpdatedAppsProvider getProviderOverride(
    covariant UpdatedAppsProvider provider,
  ) {
    return call(
      page: provider.page,
      pageSize: provider.pageSize,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updatedAppsProvider';
}

/// See also [updatedApps].
class UpdatedAppsProvider extends AutoDisposeFutureProvider<FlathubPagination> {
  /// See also [updatedApps].
  UpdatedAppsProvider({
    int page = 1,
    int pageSize = 50,
  }) : this._internal(
          (ref) => updatedApps(
            ref as UpdatedAppsRef,
            page: page,
            pageSize: pageSize,
          ),
          from: updatedAppsProvider,
          name: r'updatedAppsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatedAppsHash,
          dependencies: UpdatedAppsFamily._dependencies,
          allTransitiveDependencies:
              UpdatedAppsFamily._allTransitiveDependencies,
          page: page,
          pageSize: pageSize,
        );

  UpdatedAppsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.pageSize,
  }) : super.internal();

  final int page;
  final int pageSize;

  @override
  Override overrideWith(
    FutureOr<FlathubPagination> Function(UpdatedAppsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatedAppsProvider._internal(
        (ref) => create(ref as UpdatedAppsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubPagination> createElement() {
    return _UpdatedAppsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatedAppsProvider &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdatedAppsRef on AutoDisposeFutureProviderRef<FlathubPagination> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;
}

class _UpdatedAppsProviderElement
    extends AutoDisposeFutureProviderElement<FlathubPagination>
    with UpdatedAppsRef {
  _UpdatedAppsProviderElement(super.provider);

  @override
  int get page => (origin as UpdatedAppsProvider).page;
  @override
  int get pageSize => (origin as UpdatedAppsProvider).pageSize;
}

String _$searchHash() => r'7453a354dc5e2bf968df8b3ae9b37f773075c9fd';

/// See also [search].
@ProviderFor(search)
const searchProvider = SearchFamily();

/// See also [search].
class SearchFamily extends Family<AsyncValue<FlathubPagination>> {
  /// See also [search].
  const SearchFamily();

  /// See also [search].
  SearchProvider call(
    String query, {
    int page = 1,
    int pageSize = 50,
  }) {
    return SearchProvider(
      query,
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  SearchProvider getProviderOverride(
    covariant SearchProvider provider,
  ) {
    return call(
      provider.query,
      page: provider.page,
      pageSize: provider.pageSize,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchProvider';
}

/// See also [search].
class SearchProvider extends AutoDisposeFutureProvider<FlathubPagination> {
  /// See also [search].
  SearchProvider(
    String query, {
    int page = 1,
    int pageSize = 50,
  }) : this._internal(
          (ref) => search(
            ref as SearchRef,
            query,
            page: page,
            pageSize: pageSize,
          ),
          from: searchProvider,
          name: r'searchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchHash,
          dependencies: SearchFamily._dependencies,
          allTransitiveDependencies: SearchFamily._allTransitiveDependencies,
          query: query,
          page: page,
          pageSize: pageSize,
        );

  SearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
    required this.page,
    required this.pageSize,
  }) : super.internal();

  final String query;
  final int page;
  final int pageSize;

  @override
  Override overrideWith(
    FutureOr<FlathubPagination> Function(SearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchProvider._internal(
        (ref) => create(ref as SearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FlathubPagination> createElement() {
    return _SearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProvider &&
        other.query == query &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchRef on AutoDisposeFutureProviderRef<FlathubPagination> {
  /// The parameter `query` of this provider.
  String get query;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;
}

class _SearchProviderElement
    extends AutoDisposeFutureProviderElement<FlathubPagination> with SearchRef {
  _SearchProviderElement(super.provider);

  @override
  String get query => (origin as SearchProvider).query;
  @override
  int get page => (origin as SearchProvider).page;
  @override
  int get pageSize => (origin as SearchProvider).pageSize;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
