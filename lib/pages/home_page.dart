import 'package:auto_route/auto_route.dart';
import 'package:deckhub/api/appstream.dart';
import 'package:deckhub/api/extensions.dart';
import 'package:deckhub/providers/pages.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/widgets/page_content_layout.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flux/flux.dart';
import 'package:deckhub/widgets/app_grid.dart';
import 'package:deckhub/widgets/async_page_builder.dart';
import 'package:deckhub/widgets/weekly_apps_carousel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(homePageProvider);

    return AsyncPageBuilder(
      value: data,
      builder: (context, data) {
        final appOfTheDay = data.appOfTheDay as FlathubAppstreamDesktop;

        return PageContentLayout(
          contentPadding: const EdgeInsets.all(16),
          children: [
            WeeklyAppsCarousel(apps: data.appsOfTheWeek),
            const SizedBox(height: 24),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeaturedAppTile(
                    appName: appOfTheDay.name,
                    appSummary: appOfTheDay.summary,
                    appIcon: appOfTheDay.icon!,
                    appId: appOfTheDay.id,
                    brandColor: appOfTheDay.getBrandColor(context),
                    groupName: "App of the Day",
                    groupIcon: Icons.star_rounded,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeaturedAppTile(
                    appId: data.circleAppOfTheDay.id,
                    appName: data.circleAppOfTheDay.name,
                    appSummary: data.circleAppOfTheDay.summary,
                    appIcon: data.circleAppOfTheDay.icon,
                    brandColor: data.circleAppOfTheDay.getBrandColor(context),
                    groupName: "GNOME Circle",
                    groupIcon: Icons.circle_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppGrid(
              data: data.trendingApps.hits,
              title: "Trending Apps",
              showMoreLabel: "More Trending",
              onMore: () => context.router.push(TrendingAppsRoute()),
            ),
            const SizedBox(height: 32),
            AppGrid(
              data: data.popularApps.hits,
              title: "Popular Apps",
              showMoreLabel: "More Popular",
              onMore: () => context.router.push(PopularAppsRoute()),
            ),
            const SizedBox(height: 32),
            AppGrid(
              data: data.newApps.hits,
              title: "New Apps",
              showMoreLabel: "More New",
              onMore: () => context.router.push(NewAppsRoute()),
            ),
            const SizedBox(height: 32),
            AppGrid(
              data: data.updatedApps.hits,
              title: "Recently Updated",
              showMoreLabel: "More Updated",
              onMore: () => context.router.push(UpdatedAppsRoute()),
            ),
          ],
        );
      },
    );
  }
}

class FeaturedAppTile extends StatelessWidget {
  final String groupName;
  final IconData groupIcon;
  final String appName;
  final String? appSummary;
  final String appIcon;
  final Color? brandColor;
  final String appId;
  const FeaturedAppTile({
    super.key,
    required this.groupName,
    required this.groupIcon,
    required this.appName,
    required this.appIcon,
    required this.appId,
    this.appSummary,
    this.brandColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth >= 800
              ? constraints.maxWidth / 2 - 8
              : constraints.maxWidth,
          height: 192,
          child: Card(
            color: brandColor,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => context.router.push(AppRoute(
                appId: appId,
                nameHint: appName,
              )),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              groupIcon,
                              size: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            Text(groupName,
                                style: context.textTheme.titleMedium),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          width: constraints.maxWidth >= 950 ? 300 : 200,
                          child: Text(
                            appName,
                            style: context.textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: constraints.maxWidth >= 950 ? 300 : 200,
                          child: Text(
                            appSummary ?? '',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    if (appIcon.endsWith(".svg"))
                      SvgPicture.network(
                        appIcon,
                        width: 128,
                        height: 128,
                      )
                    else
                      Image.network(
                        appIcon,
                        width: 128,
                        height: 128,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
