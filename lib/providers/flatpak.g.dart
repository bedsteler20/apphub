// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flatpak.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userInstallationHash() => r'5f6f4961a8e4effaa100dba3a91030e4d6bb850c';

/// See also [userInstallation].
@ProviderFor(userInstallation)
final userInstallationProvider =
    AutoDisposeProvider<FlatpakInstallation>.internal(
  userInstallation,
  name: r'userInstallationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userInstallationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserInstallationRef = AutoDisposeProviderRef<FlatpakInstallation>;
String _$systemInstallationHash() =>
    r'a52ca1f47258946f305be8c08cec946c5a6e2bde';

/// See also [systemInstallation].
@ProviderFor(systemInstallation)
final systemInstallationProvider =
    AutoDisposeProvider<FlatpakInstallation>.internal(
  systemInstallation,
  name: r'systemInstallationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$systemInstallationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SystemInstallationRef = AutoDisposeProviderRef<FlatpakInstallation>;
String _$installedAppsHash() => r'76d513e876c496a550a5810cefbe50d4c3517b16';

/// See also [installedApps].
@ProviderFor(installedApps)
final installedAppsProvider = AutoDisposeProvider<List<InstalledApp>>.internal(
  installedApps,
  name: r'installedAppsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$installedAppsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InstalledAppsRef = AutoDisposeProviderRef<List<InstalledApp>>;
String _$installedAppsWithUpdatesHash() =>
    r'617b4d4105670e0fa671536a9db541835f334ee9';

/// See also [installedAppsWithUpdates].
@ProviderFor(installedAppsWithUpdates)
final installedAppsWithUpdatesProvider =
    AutoDisposeFutureProvider<List<InstalledApp>>.internal(
  installedAppsWithUpdates,
  name: r'installedAppsWithUpdatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$installedAppsWithUpdatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InstalledAppsWithUpdatesRef
    = AutoDisposeFutureProviderRef<List<InstalledApp>>;
String _$installedAppHash() => r'ee9d92d327c0e728f39cc32add1373a9fae32158';

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

/// See also [installedApp].
@ProviderFor(installedApp)
const installedAppProvider = InstalledAppFamily();

/// See also [installedApp].
class InstalledAppFamily extends Family<InstalledApp?> {
  /// See also [installedApp].
  const InstalledAppFamily();

  /// See also [installedApp].
  InstalledAppProvider call(
    String appId,
  ) {
    return InstalledAppProvider(
      appId,
    );
  }

  @override
  InstalledAppProvider getProviderOverride(
    covariant InstalledAppProvider provider,
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
  String? get name => r'installedAppProvider';
}

/// See also [installedApp].
class InstalledAppProvider extends AutoDisposeProvider<InstalledApp?> {
  /// See also [installedApp].
  InstalledAppProvider(
    String appId,
  ) : this._internal(
          (ref) => installedApp(
            ref as InstalledAppRef,
            appId,
          ),
          from: installedAppProvider,
          name: r'installedAppProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$installedAppHash,
          dependencies: InstalledAppFamily._dependencies,
          allTransitiveDependencies:
              InstalledAppFamily._allTransitiveDependencies,
          appId: appId,
        );

  InstalledAppProvider._internal(
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
    InstalledApp? Function(InstalledAppRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InstalledAppProvider._internal(
        (ref) => create(ref as InstalledAppRef),
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
  AutoDisposeProviderElement<InstalledApp?> createElement() {
    return _InstalledAppProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InstalledAppProvider && other.appId == appId;
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
mixin InstalledAppRef on AutoDisposeProviderRef<InstalledApp?> {
  /// The parameter `appId` of this provider.
  String get appId;
}

class _InstalledAppProviderElement
    extends AutoDisposeProviderElement<InstalledApp?> with InstalledAppRef {
  _InstalledAppProviderElement(super.provider);

  @override
  String get appId => (origin as InstalledAppProvider).appId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
