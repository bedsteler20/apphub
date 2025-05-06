import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:deckhub/api/appstream.dart';
import 'package:deckhub/api/extensions.dart';
import 'package:deckhub/api/summary.dart';
import 'package:deckhub/flatpak/base.dart';
import 'package:deckhub/flatpak/installed_app.dart';
import 'package:deckhub/hooks/util_hooks.dart';
import 'package:deckhub/providers/flatpak.dart';
import 'package:deckhub/providers/pages.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/utils/std.dart';
import 'package:deckhub/widgets/app_grid.dart';
import 'package:deckhub/widgets/async_page_builder.dart';
import 'package:deckhub/widgets/page_content_layout.dart';
import 'package:deckhub/widgets/terminal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flux/flux.dart';

@RoutePage()
class AppPage extends HookConsumerWidget {
  final String appId;
  final String? nameHint;
  const AppPage({
    super.key,
    @pathParam required this.appId,
    @queryParam this.nameHint,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(appPageProvider(appId));

    return AsyncPageBuilder(
      value: data,
      builder: (BuildContext context, AppPageData data) {
        final (:appstream, :summary, :devsOtherApps, :installedApp) = data;

        return PageContentLayout(
          contentPadding: const EdgeInsets.all(20),
          children: [
            AppPageHeader(appstream: appstream),
            if (appstream is FlathubAppstreamDesktop)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppPageScreenshots(appstream: appstream),
              ),
            if (appstream is FlathubAppstreamDesktop)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppPageDescription(appstream: appstream),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen =
                      constraints.maxWidth > 800 && appstream.urls != null;
                  return Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: constraints.maxWidth < 800
                        ? Axis.vertical
                        : Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: isWideScreen
                            ? constraints.maxWidth / 2
                            : constraints.maxWidth,
                        child: Column(
                          children: [
                            AppPageLicenseCard(appstream: appstream),
                            const SizedBox(height: 16),
                            AppPageDownloadInfo(summary: summary),
                          ],
                        ),
                      ),
                      if (appstream.urls != null)
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: isWideScreen
                              ? constraints.maxWidth / 2
                              : constraints.maxWidth,
                          child: AppPageLinks(links: appstream.urls!),
                        ),
                    ],
                  );
                },
              ),
            ),
            if (devsOtherApps.length > 1)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppGrid(
                  onMore: () => context.router
                      .push(DeveloperRoute(name: appstream.developerName!)),
                  showMoreLabel: devsOtherApps.length >= 6 ? "See more" : null,
                  title: 'Other apps by ${appstream.developerName}',
                  data: devsOtherApps,
                ),
              ),
          ],
        );
      },
    );
  }
}

class AppPageLicenseCard extends StatelessWidget {
  final FlathubAppstream appstream;
  const AppPageLicenseCard({super.key, required this.appstream});

  @override
  Widget build(BuildContext context) {
    final iconColor = appstream.isFreeLicense
        ? context.colorScheme.primary
        : context.colorScheme.error;
    final icons = [
      appstream.isFreeLicense
          ? Icons.favorite_rounded
          : Icons.front_hand_rounded,
      appstream.isFreeLicense ? Icons.groups_rounded : Icons.warning_rounded,
      appstream.isFreeLicense
          ? Icons.thumb_up_alt_rounded
          : Icons.visibility_off_rounded
    ];
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var ico in icons)
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconColor.withOpacity(0.1),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(8),
                    child: Icon(ico, color: iconColor, size: 28),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              appstream.isFreeLicense ? "Community built" : "Proprietary",
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              appstream.isFreeLicense
                  ? "This app is developed in the open by an international community, and released under the ${appstream.projectLicense}."
                  : "This app is not developed in the open, so only its developers know how it works. It may be insecure in ways that are hard to detect, and it may change without oversight.",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.textTheme.bodyMedium?.color?.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppPageDownloadInfo extends StatelessWidget {
  final FlathubSummary summary;

  const AppPageDownloadInfo({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.storage_rounded),
            title: const Text('Install Size'),
            subtitle: Text("~${summary.installedSize.toFileSize()}"),
          ),
          ListTile(
            leading: const Icon(Icons.file_download_outlined),
            title: const Text('Download Size'),
            subtitle: Text(summary.downloadSize.toFileSize()),
          ),
          ListTile(
            leading: const Icon(Icons.devices_rounded),
            title: const Text('Available Architectures'),
            subtitle: Text(summary.arches.join(', ')),
          ),
        ],
      ),
    );
  }
}

class AppPageLinks extends StatelessWidget {
  final FlathubAppstreamUrls links;
  const AppPageLinks({super.key, required this.links});

  Widget buildLink(
      BuildContext context, IconData icon, String title, String url) {
    return ListTile(
      leading: Icon(icon),
      trailing: Icon(
        Icons.open_in_new,
        color: context.colorScheme.onSurface.withOpacity(0.5),
      ),
      title: Text(title),
      subtitle: Text(url),
      onTap: () {
        launchUrlString(url);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          if (links.homepage != null)
            buildLink(context, Icons.home_rounded, 'Homepage', links.homepage!),
          if (links.donation != null)
            buildLink(context, Icons.monetization_on_rounded, 'Donate',
                links.donation!),
          if (links.help != null)
            buildLink(context, Icons.help_rounded, 'Help', links.help!),
          if (links.faq != null)
            buildLink(
                context, Icons.question_answer_rounded, 'FAQ', links.faq!),
          if (links.contact != null)
            buildLink(context, Icons.mail_rounded, 'Contact', links.contact!),
          if (links.vcsBrowser != null)
            buildLink(
                context, Icons.code_rounded, 'Source code', links.vcsBrowser!),
          if (links.translate != null)
            buildLink(context, Icons.translate_rounded, 'Translate',
                links.translate!),
          if (links.bugtracker != null)
            buildLink(context, Icons.bug_report_rounded, 'Bugtracker',
                links.bugtracker!),
        ],
      ),
    );
  }
}

class AppPageDescription extends StatelessWidget {
  final FlathubAppstreamDesktop appstream;
  const AppPageDescription({super.key, required this.appstream});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appstream.summary ?? '',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        HtmlWidget(
          appstream.description ?? '',
          textStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.textTheme.bodyMedium?.color?.withOpacity(0.8),
          ),
          customStylesBuilder: (element) => element.localName == 'li'
              ? {
                  'margin-top': '12px',
                  'margin-bottom': '12px',
                }
              : null,
        ),
      ],
    );
  }
}

class AppPageScreenshots extends HookWidget {
  final FlathubAppstreamDesktop appstream;

  const AppPageScreenshots({
    super.key,
    required this.appstream,
  });

  @override
  Widget build(BuildContext context) {
    final screenshots = useMemoized(() => appstream.screenshots
        .map((s) => s.pickSize(580))
        .where((s) => s != null)
        .cast<FlathubAppstreamScreenShotSize>()
        .toList());
    final controller = useCarouselController();
    final index = useState<int>(0);
    final caption = useState<String?>(
        screenshots.isNotEmpty ? screenshots.first.caption : null);

    if (screenshots.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: [
        Center(
          child: Container(
            constraints: const BoxConstraints(maxHeight: 456),
            child: CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                viewportFraction: 1.0,
                onPageChanged: (i, reason) {
                  caption.value = screenshots[i].caption;
                  index.value = i;
                },
              ),
              items: [
                for (final screenshot in screenshots)
                  CachedNetworkImage(
                    imageUrl: screenshot.src,
                    fit: BoxFit.fitHeight,
                  ),
              ],
            ),
          ),
        ),
        if (caption.value != null)
          Text(
            caption.value!,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        const SizedBox(height: 10),
        if (screenshots.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < screenshots.length; i++)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    onTap: () {
                      controller.animateToPage(i);
                    },
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == index.value
                            ? context.colorScheme.onSurface
                            : context.colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class AppPageHeader extends ConsumerWidget {
  final FlathubAppstream appstream;

  const AppPageHeader({
    super.key,
    required this.appstream,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLargeScreen = context.width > 600;
    final children = [
      if (appstream.icon != null)
        CachedNetworkImage(
          imageUrl: appstream.icon!,
        ),
      if (isLargeScreen) const SizedBox(width: 40),
      Column(
        crossAxisAlignment: isLargeScreen
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            appstream.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "by ${appstream.developerName ?? 'Unknown'}",
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.textTheme.bodyMedium?.color?.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 10),
          if (appstream.metadata?.verificationMethod != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified,
                    color: context.colorScheme.primary, size: 20),
                const SizedBox(width: 4),
                Text(
                  appstream.verificationTagMessage,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            )
        ],
      ),
      if (isLargeScreen)
        Expanded(child: Container())
      else
        const SizedBox(height: 20),
      AppPageInstallButton(appstream: appstream),
    ];

    if (isLargeScreen) {
      return Row(
        children: children,
      );
    } else {
      return Center(
        child: Column(
          children: children,
        ),
      );
    }
  }
}

class AppPageInstallButton extends ConsumerWidget {
  final FlathubAppstream appstream;
  final InstalledApp? installedApp;

  const AppPageInstallButton({
    super.key,
    required this.appstream,
    this.installedApp,
  });

  Future<void> onInstall(BuildContext context, WidgetRef ref) async {
    CommandTerminalDialog.showInstall(
      context,
      appstream.id,
      onExit: (success) {
        if (success) ref.invalidate(installedAppsProvider);
      },
    );
  }

  Future<void> onUninstall(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return FluxConfirmDialog(
          title: 'Uninstall App',
          message: 'Are you sure you want to uninstall ${appstream.name}?',
          confirmText: 'Uninstall',
          confirmButtonColor: context.colorScheme.error.withAlpha(30),
          confirmTextColor: context.colorScheme.error,
          cancelText: 'Cancel',
          onResult: (result) async {
            if (result) {
              CommandTerminalDialog.showUninstall(
                ref.context,
                appstream.id,
                user: installedApp?.isUser ?? false,
                onExit: (success) {
                  if (success) ref.invalidate(installedAppsProvider);
                },
              );
            }
          },
        );
      },
    );
  }

  void onOpen(BuildContext context) {
    if (isSandBoxed) {
      Process.run("flatpak-spawn", [
        "--host",
        "bash",
        "-c",
        "flatpak run ${appstream.id} &",
      ]);
    } else {
      Process.run("bash", [
        "-c",
        "flatpak run ${appstream.id} &",
      ]);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (installedApp != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () => onInstall(context, ref),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                context.colorScheme.primary,
              ),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 0, vertical: 11),
              ),
            ),
            child: const Icon(
              Icons.refresh_rounded,
              size: 32,
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            child: FilledButton(
              onPressed: () => onUninstall(context, ref),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  context.colorScheme.error,
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 11),
                ),
              ),
              child: const Icon(
                Icons.delete_rounded,
                size: 32,
              ),
            ),
          ),
        ],
      );
    } else {
      return FilledButton(
        onPressed: () => onInstall(context, ref),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            context.colorScheme.primary,
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
        child: Text(
          "Install",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
      );
    }
  }
}
