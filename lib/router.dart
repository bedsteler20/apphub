import 'package:auto_route/auto_route.dart';
import 'package:deckhub/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final routes = [
    AutoRoute(
      path: '/',
      title: (context, data) => 'Home',
      page: ScaffoldRoute.page,
      children: [
        AutoRoute(
          page: MainRoute.page,
          path: '',
          initial: true,
          children: [
            AutoRoute(
              title: (context, data) => 'Home',
              page: HomeRoute.page,
              initial: true,
              path: '',
            ),
            AutoRoute(
              title: (context, data) => 'Installed Apps',
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
          page: TrendingAppsRoute.page,
          path: 'apps/collection/trending/:page',
        ),
        AutoRoute(
          page: PopularAppsRoute.page,
          path: 'apps/collection/popular/:page',
        ),
        AutoRoute(
          page: UpdatedAppsRoute.page,
          path: 'apps/collection/recently-updated/:page',
        ),
        AutoRoute(
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
