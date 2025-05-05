import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:deckhub/api/appstream.dart';
import 'package:deckhub/api/extensions.dart';
import 'package:deckhub/router.gr.dart';
import 'package:flux/flux.dart';

import 'package:flutter/material.dart';

class WeeklyAppsCarousel extends StatelessWidget {
  final List<FlathubAppstream> apps;
  const WeeklyAppsCarousel({super.key, required this.apps});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: CarouselSlider(
        options: CarouselOptions(
          height: context.width >= 1300 ? 352 : 300,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
        ),
        items: [
          for (final app in apps)
            WeeklyAppsCard(app: app as FlathubAppstreamDesktop),
        ],
      ),
    );
  }
}

class WeeklyAppsCard extends StatelessWidget {
  final FlathubAppstreamDesktop app;
  const WeeklyAppsCard({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final isBig = context.width >= 1300;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: app.getBrandColor(context),
        child: InkWell(
          onTap: () => context.router.push(AppRoute(
            appId: app.id,
            nameHint: app.name,
          )),
          child: Padding(
            padding: EdgeInsets.only(left: isBig ? 128 : 64, right: 64),
            child: Stack(
              children: [
                Align(
                  alignment: isBig ? Alignment.centerLeft : Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        app.icon!,
                        width: 128,
                        height: 128,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        app.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: context.colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        app.summary ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                if (context.width >= 1300)
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: constraints.maxWidth * 0.666 - 100,
                      child: Image.network(
                        alignment: Alignment.topCenter,
                        app.screenshots.first.sizes.first.src,
                        width: constraints.maxWidth * 0.666 - 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
