import 'package:auto_route/auto_route.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final routes = [
    AutoRoute(
      path: '/',
      title: (context, data) => t.pageNames.home,
      page: ScaffoldRoute.page,
      children: [
        AutoRoute(
          page: MainRoute.page,
          path: '',
          initial: true,
          children: [
            AutoRoute(
              title: (context, data) => t.pageNames.home,
              page: HomeRoute.page,
              initial: true,
              path: '',
            ),
            AutoRoute(
              title: (context, data) => t.pageNames.installedApps,
              page: InstalledAppsRoute.page,
              path: 'installed',
            ),
          ],
        ),
        AutoRoute(
          page: SearchRoute.page,
          path: 'search',
        ),
        AutoRoute(
          title: (context, data) => t.pageNames.trending,
          page: TrendingAppsRoute.page,
          path: 'apps/collection/trending/:page',
        ),
        AutoRoute(
          title: (context, data) => t.pageNames.popular,
          page: PopularAppsRoute.page,
          path: 'apps/collection/popular/:page',
        ),
        AutoRoute(
          title: (context, data) => t.pageNames.recentlyUpdated,
          page: UpdatedAppsRoute.page,
          path: 'apps/collection/recently-updated/:page',
        ),
        AutoRoute(
          title: (context, data) => t.pageNames.recentlyAdded,
          page: NewAppsRoute.page,
          path: 'apps/collection/recently-added/:page',
        ),
        AutoRoute(
          page: DeveloperRoute.page,
          path: 'apps/developer/:name/:page',
        ),
        AutoRoute(
            page: AppRoute.page,
            path: 'apps/:appId',
            title: (context, data) =>
                data.queryParams.getString("nameHint", "")),
      ],
    )
  ];
}
