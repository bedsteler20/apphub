import 'package:auto_route/auto_route.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/providers/flathub.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/widgets/pagination_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TrendingAppsPage extends ConsumerWidget {
  final int page;
  final int pageSize;

  const TrendingAppsPage({
    super.key,
    @pathParam this.page = 1,
    @queryParam this.pageSize = 42,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationLayout(
      label: 'Trending Apps',
      onPageChanged: (page) {
        context.router.replace(TrendingAppsRoute(page: page));
      },
      data: ref.watch(trendingAppsProvider(
        page: page,
        pageSize: pageSize,
      )),
    );
  }
}

@RoutePage()
class PopularAppsPage extends ConsumerWidget {
  final int page;
  final int pageSize;

  const PopularAppsPage({
    super.key,
    @pathParam this.page = 1,
    @queryParam this.pageSize = 42,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationLayout(
      label: t.pageNames.popular,
      onPageChanged: (page) {
        context.router.replace(PopularAppsRoute(page: page));
      },
      data: ref.watch(popularAppsProvider(
        page: page,
        pageSize: pageSize,
      )),
    );
  }
}

@RoutePage()
class UpdatedAppsPage extends ConsumerWidget {
  final int page;
  final int pageSize;

  const UpdatedAppsPage({
    super.key,
    @pathParam this.page = 1,
    @queryParam this.pageSize = 42,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationLayout(
      label: t.pageNames.recentlyUpdated,
      onPageChanged: (page) {
        context.router.replace(UpdatedAppsRoute(page: page));
      },
      data: ref.watch(updatedAppsProvider(
        page: page,
        pageSize: pageSize,
      )),
    );
  }
}

@RoutePage()
class NewAppsPage extends ConsumerWidget {
  final int page;
  final int pageSize;

  const NewAppsPage({
    super.key,
    @pathParam this.page = 1,
    @queryParam this.pageSize = 42,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationLayout(
      label: t.pageNames.recentlyAdded,
      onPageChanged: (page) {
        context.router.replace(NewAppsRoute(page: page));
      },
      data: ref.watch(newAppsProvider(
        page: page,
        pageSize: pageSize,
      )),
    );
  }
}

@RoutePage()
class DeveloperPage extends ConsumerWidget {
  final String name;
  final int page;
  final int pageSize;

  const DeveloperPage({
    super.key,
    @pathParam required this.name,
    @pathParam this.page = 1,
    @queryParam this.pageSize = 42,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationLayout(
      label: t.pageNames.developer(developer: name),
      onPageChanged: (page) {
        context.router.replace(DeveloperRoute(name: name, page: page));
      },
      data: ref.watch(developerProvider(
        name,
        page: page,
        pageSize: pageSize,
      )),
    );
  }
}
