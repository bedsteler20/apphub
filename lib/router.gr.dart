// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:deckhub/pages/app_page.dart' as _i1;
import 'package:deckhub/pages/home_page.dart' as _i3;
import 'package:deckhub/pages/installed_page.dart' as _i4;
import 'package:deckhub/pages/pagination_page.dart' as _i2;
import 'package:deckhub/pages/scaffold.dart' as _i5;
import 'package:deckhub/pages/search_page.dart' as _i6;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.AppPage]
class AppRoute extends _i7.PageRouteInfo<AppRouteArgs> {
  AppRoute({
    _i8.Key? key,
    required String appId,
    String? nameHint,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AppRoute.name,
          args: AppRouteArgs(
            key: key,
            appId: appId,
            nameHint: nameHint,
          ),
          rawPathParams: {'appId': appId},
          rawQueryParams: {'nameHint': nameHint},
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<AppRouteArgs>(
          orElse: () => AppRouteArgs(
                appId: pathParams.getString('appId'),
                nameHint: queryParams.optString('nameHint'),
              ));
      return _i1.AppPage(
        key: args.key,
        appId: args.appId,
        nameHint: args.nameHint,
      );
    },
  );
}

class AppRouteArgs {
  const AppRouteArgs({
    this.key,
    required this.appId,
    this.nameHint,
  });

  final _i8.Key? key;

  final String appId;

  final String? nameHint;

  @override
  String toString() {
    return 'AppRouteArgs{key: $key, appId: $appId, nameHint: $nameHint}';
  }
}

/// generated route for
/// [_i2.DeveloperPage]
class DeveloperRoute extends _i7.PageRouteInfo<DeveloperRouteArgs> {
  DeveloperRoute({
    _i8.Key? key,
    required String name,
    int page = 1,
    int pageSize = 42,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DeveloperRoute.name,
          args: DeveloperRouteArgs(
            key: key,
            name: name,
            page: page,
            pageSize: pageSize,
          ),
          rawPathParams: {
            'name': name,
            'page': page,
          },
          rawQueryParams: {'pageSize': pageSize},
          initialChildren: children,
        );

  static const String name = 'DeveloperRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<DeveloperRouteArgs>(
          orElse: () => DeveloperRouteArgs(
                name: pathParams.getString('name'),
                page: pathParams.getInt(
                  'page',
                  1,
                ),
                pageSize: queryParams.getInt(
                  'pageSize',
                  42,
                ),
              ));
      return _i2.DeveloperPage(
        key: args.key,
        name: args.name,
        page: args.page,
        pageSize: args.pageSize,
      );
    },
  );
}

class DeveloperRouteArgs {
  const DeveloperRouteArgs({
    this.key,
    required this.name,
    this.page = 1,
    this.pageSize = 42,
  });

  final _i8.Key? key;

  final String name;

  final int page;

  final int pageSize;

  @override
  String toString() {
    return 'DeveloperRouteArgs{key: $key, name: $name, page: $page, pageSize: $pageSize}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.InstalledAppsPage]
class InstalledAppsRoute extends _i7.PageRouteInfo<void> {
  const InstalledAppsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          InstalledAppsRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstalledAppsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.InstalledAppsPage();
    },
  );
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainPage();
    },
  );
}

/// generated route for
/// [_i2.NewAppsPage]
class NewAppsRoute extends _i7.PageRouteInfo<NewAppsRouteArgs> {
  NewAppsRoute({
    _i8.Key? key,
    int page = 1,
    int pageSize = 42,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          NewAppsRoute.name,
          args: NewAppsRouteArgs(
            key: key,
            page: page,
            pageSize: pageSize,
          ),
          rawPathParams: {'page': page},
          rawQueryParams: {'pageSize': pageSize},
          initialChildren: children,
        );

  static const String name = 'NewAppsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<NewAppsRouteArgs>(
          orElse: () => NewAppsRouteArgs(
                page: pathParams.getInt(
                  'page',
                  1,
                ),
                pageSize: queryParams.getInt(
                  'pageSize',
                  42,
                ),
              ));
      return _i2.NewAppsPage(
        key: args.key,
        page: args.page,
        pageSize: args.pageSize,
      );
    },
  );
}

class NewAppsRouteArgs {
  const NewAppsRouteArgs({
    this.key,
    this.page = 1,
    this.pageSize = 42,
  });

  final _i8.Key? key;

  final int page;

  final int pageSize;

  @override
  String toString() {
    return 'NewAppsRouteArgs{key: $key, page: $page, pageSize: $pageSize}';
  }
}

/// generated route for
/// [_i2.PopularAppsPage]
class PopularAppsRoute extends _i7.PageRouteInfo<PopularAppsRouteArgs> {
  PopularAppsRoute({
    _i8.Key? key,
    int page = 1,
    int pageSize = 42,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PopularAppsRoute.name,
          args: PopularAppsRouteArgs(
            key: key,
            page: page,
            pageSize: pageSize,
          ),
          rawPathParams: {'page': page},
          rawQueryParams: {'pageSize': pageSize},
          initialChildren: children,
        );

  static const String name = 'PopularAppsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<PopularAppsRouteArgs>(
          orElse: () => PopularAppsRouteArgs(
                page: pathParams.getInt(
                  'page',
                  1,
                ),
                pageSize: queryParams.getInt(
                  'pageSize',
                  42,
                ),
              ));
      return _i2.PopularAppsPage(
        key: args.key,
        page: args.page,
        pageSize: args.pageSize,
      );
    },
  );
}

class PopularAppsRouteArgs {
  const PopularAppsRouteArgs({
    this.key,
    this.page = 1,
    this.pageSize = 42,
  });

  final _i8.Key? key;

  final int page;

  final int pageSize;

  @override
  String toString() {
    return 'PopularAppsRouteArgs{key: $key, page: $page, pageSize: $pageSize}';
  }
}

/// generated route for
/// [_i5.ScaffoldPage]
class ScaffoldRoute extends _i7.PageRouteInfo<void> {
  const ScaffoldRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ScaffoldRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScaffoldRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ScaffoldPage();
    },
  );
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i8.Key? key,
    int page = 1,
    int pageSize = 42,
    String query = '',
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            page: page,
            pageSize: pageSize,
            query: query,
          ),
          rawPathParams: {
            'page': page,
            'query': query,
          },
          rawQueryParams: {'pageSize': pageSize},
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<SearchRouteArgs>(
          orElse: () => SearchRouteArgs(
                page: pathParams.getInt(
                  'page',
                  1,
                ),
                pageSize: queryParams.getInt(
                  'pageSize',
                  42,
                ),
                query: pathParams.getString(
                  'query',
                  '',
                ),
              ));
      return _i6.SearchPage(
        key: args.key,
        page: args.page,
        pageSize: args.pageSize,
        query: args.query,
      );
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.page = 1,
    this.pageSize = 42,
    this.query = '',
  });

  final _i8.Key? key;

  final int page;

  final int pageSize;

  final String query;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, page: $page, pageSize: $pageSize, query: $query}';
  }
}

/// generated route for
/// [_i2.TrendingAppsPage]
class TrendingAppsRoute extends _i7.PageRouteInfo<TrendingAppsRouteArgs> {
  TrendingAppsRoute({
    _i8.Key? key,
    int page = 1,
    int pageSize = 42,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          TrendingAppsRoute.name,
          args: TrendingAppsRouteArgs(
            key: key,
            page: page,
            pageSize: pageSize,
          ),
          rawPathParams: {'page': page},
          rawQueryParams: {'pageSize': pageSize},
          initialChildren: children,
        );

  static const String name = 'TrendingAppsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<TrendingAppsRouteArgs>(
          orElse: () => TrendingAppsRouteArgs(
                page: pathParams.getInt(
                  'page',
                  1,
                ),
                pageSize: queryParams.getInt(
                  'pageSize',
                  42,
                ),
              ));
      return _i2.TrendingAppsPage(
        key: args.key,
        page: args.page,
        pageSize: args.pageSize,
      );
    },
  );
}

class TrendingAppsRouteArgs {
  const TrendingAppsRouteArgs({
    this.key,
    this.page = 1,
    this.pageSize = 42,
  });

  final _i8.Key? key;

  final int page;

  final int pageSize;

  @override
  String toString() {
    return 'TrendingAppsRouteArgs{key: $key, page: $page, pageSize: $pageSize}';
  }
}

/// generated route for
/// [_i2.UpdatedAppsPage]
class UpdatedAppsRoute extends _i7.PageRouteInfo<UpdatedAppsRouteArgs> {
  UpdatedAppsRoute({
    _i8.Key? key,
    int page = 1,
    int pageSize = 42,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          UpdatedAppsRoute.name,
          args: UpdatedAppsRouteArgs(
            key: key,
            page: page,
            pageSize: pageSize,
          ),
          rawPathParams: {'page': page},
          rawQueryParams: {'pageSize': pageSize},
          initialChildren: children,
        );

  static const String name = 'UpdatedAppsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<UpdatedAppsRouteArgs>(
          orElse: () => UpdatedAppsRouteArgs(
                page: pathParams.getInt(
                  'page',
                  1,
                ),
                pageSize: queryParams.getInt(
                  'pageSize',
                  42,
                ),
              ));
      return _i2.UpdatedAppsPage(
        key: args.key,
        page: args.page,
        pageSize: args.pageSize,
      );
    },
  );
}

class UpdatedAppsRouteArgs {
  const UpdatedAppsRouteArgs({
    this.key,
    this.page = 1,
    this.pageSize = 42,
  });

  final _i8.Key? key;

  final int page;

  final int pageSize;

  @override
  String toString() {
    return 'UpdatedAppsRouteArgs{key: $key, page: $page, pageSize: $pageSize}';
  }
}
