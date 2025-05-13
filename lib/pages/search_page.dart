import 'package:auto_route/auto_route.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/providers/flathub.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/widgets/pagination_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SearchPage extends ConsumerWidget {
  final int page;
  final int pageSize;
  final String query;

  const SearchPage({
    super.key,
    @pathParam this.page = 1,
    @queryParam this.pageSize = 42,
    @pathParam this.query = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationLayout(
      label: t.search.searchResult(query: query),
      onPageChanged: (page) {
        context.router.replace(SearchRoute(
          page: page,
          pageSize: pageSize,
          query: query,
        ));
      },
      data: ref.watch(searchProvider(
        query,
        page: page,
        pageSize: pageSize,
      )),
    );
  }
}
