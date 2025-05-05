import 'package:deckhub/api/pagination.dart';
import 'package:flux/flux.dart';

import 'package:deckhub/widgets/app_tile.dart';
import 'package:flutter/material.dart';

class AppGrid extends StatelessWidget {
  final List<FlathubAppHit> data;
  final String? title;
  final void Function()? onMore;
  final String? showMoreLabel;
  const AppGrid({
    super.key,
    required this.data,
    this.title,
    this.onMore,
    this.showMoreLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.width >= 1300
                ? 3
                : context.width >= 800
                    ? 2
                    : 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 120,
          ),
          itemBuilder: (context, index) {
            final app = data[index];
            return AppTile(
              app: app,
            );
          },
        ),
        if (showMoreLabel != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(
              child: ElevatedButton(
                onPressed: onMore,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    showMoreLabel!,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
