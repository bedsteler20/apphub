import 'package:deckhub/api/pagination.dart';
import 'package:deckhub/widgets/app_grid.dart';
import 'package:deckhub/widgets/async_page_builder.dart';
import 'package:deckhub/widgets/page_content_layout.dart';
import 'package:flutter/material.dart';
import 'package:flux/flux.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_paginator/number_paginator.dart';

class PaginationLayout extends StatelessWidget {
  const PaginationLayout({
    super.key,
    required this.onPageChanged,
    required this.label,
    required this.data,
    this.header,
  });

  final void Function(int) onPageChanged;
  final String label;
  final AsyncValue<FlathubPagination> data;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return AsyncPageBuilder(
      value: data,
      builder: (context, data) {
        return PageContentLayout(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.start,
              ),
            ),
            AppGrid(data: data.hits),
            const SizedBox(height: 12),
            if (data.totalPages > 1)
              Center(
                child: SizedBox(
                  width: context.isScreenSize(SM) ? 300 : 500,
                  child: NumberPaginator(
                    initialPage: data.page - 1,
                    numberPages: data.totalPages,
                    onPageChange: (page) => onPageChanged(page + 1),
                  ),
                ),
              ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
