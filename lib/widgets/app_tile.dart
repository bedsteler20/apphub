import 'package:deckhub/api/extensions.dart';
import 'package:deckhub/api/pagination.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flux/flux.dart';

import 'package:flutter/material.dart';
import 'package:deckhub/router.gr.dart';

class AppTile extends StatelessWidget {
  final FlathubAppHit app;
  const AppTile({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            context.router.push(AppRoute(
              appId: app.appId,
              nameHint: app.name,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  app.icon ?? '',
                  height: 96,
                  width: 96,
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: constraints.maxWidth - 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth - 160,
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              app.name!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (app.verificationMethod != "none" ||
                                app.verificationMethod == null)
                              Tooltip(
                                message: app.verificationMessage,
                                child: Icon(
                                  Icons.verified,
                                  color: context.colorScheme.primary,
                                  size: 18,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        app.summary!,
                        style: context.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
