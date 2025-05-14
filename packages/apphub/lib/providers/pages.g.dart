// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appPageHash() => r'ee34e3bf59d0650ce899fd15b8b49bce21a00645';

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

/// See also [appPage].
@ProviderFor(appPage)
const appPageProvider = AppPageFamily();

/// See also [appPage].
class AppPageFamily extends Family<AsyncValue<AppPageData>> {
  /// See also [appPage].
  const AppPageFamily();

  /// See also [appPage].
  AppPageProvider call(
    String appId,
  ) {
    return AppPageProvider(
      appId,
    );
  }

  @override
  AppPageProvider getProviderOverride(
    covariant AppPageProvider provider,
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
  String? get name => r'appPageProvider';
}

/// See also [appPage].
class AppPageProvider extends AutoDisposeFutureProvider<AppPageData> {
  /// See also [appPage].
  AppPageProvider(
    String appId,
  ) : this._internal(
          (ref) => appPage(
            ref as AppPageRef,
            appId,
          ),
          from: appPageProvider,
          name: r'appPageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appPageHash,
          dependencies: AppPageFamily._dependencies,
          allTransitiveDependencies: AppPageFamily._allTransitiveDependencies,
          appId: appId,
        );

  AppPageProvider._internal(
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
    FutureOr<AppPageData> Function(AppPageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppPageProvider._internal(
        (ref) => create(ref as AppPageRef),
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
  AutoDisposeFutureProviderElement<AppPageData> createElement() {
    return _AppPageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppPageProvider && other.appId == appId;
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
mixin AppPageRef on AutoDisposeFutureProviderRef<AppPageData> {
  /// The parameter `appId` of this provider.
  String get appId;
}

class _AppPageProviderElement
    extends AutoDisposeFutureProviderElement<AppPageData> with AppPageRef {
  _AppPageProviderElement(super.provider);

  @override
  String get appId => (origin as AppPageProvider).appId;
}

String _$homePageHash() => r'7e793f75e82857d8f7ed604d79e15a2063b3c871';

/// See also [homePage].
@ProviderFor(homePage)
final homePageProvider = AutoDisposeFutureProvider<HomePageData>.internal(
  homePage,
  name: r'homePageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homePageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HomePageRef = AutoDisposeFutureProviderRef<HomePageData>;
String _$installedPageHash() => r'e801e4fed68ed0a0536f3b81ab8fe5b3a61153ad';

/// See also [installedPage].
@ProviderFor(installedPage)
final installedPageProvider =
    AutoDisposeFutureProvider<InstalledPageData>.internal(
  installedPage,
  name: r'installedPageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$installedPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InstalledPageRef = AutoDisposeFutureProviderRef<InstalledPageData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
