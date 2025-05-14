import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:deckhub/flatpak/ffi.dart';
import 'package:deckhub/flatpak/installed_app.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/providers/flatpak.dart';
import 'package:deckhub/providers/pages.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/widgets/page_content_layout.dart';
import 'package:deckhub/widgets/terminal.dart';
import 'package:flutter/material.dart';
import 'package:flux/flux.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class InstalledAppsPage extends ConsumerWidget {
  const InstalledAppsPage({super.key});

  Widget buildCard(BuildContext context, InstalledApp app, {Widget? trailing}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      visualDensity: VisualDensity.comfortable,
      title: Text(app.appdataName ?? app.name),
      subtitle: Text(app.appdataSummary ?? ""),
      leading: app.kind == FlatpakRefKind.app
          ? app.icon != null
              ? Image.file(File(app.icon!))
              : const Icon(Icons.apps, size: 48)
          : null,
      trailing: trailing,
      onTap: () {
        context.router.push(AppRoute(
          appId: app.name,
          nameHint: app.name,
        ));
      },
    );
  }

  Widget buildHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(installedPageProvider);

    return data.when(
      data: (value) {
        final (:apps, :runtimes, :updates) = value;
        return PageContentLayout(
          width: context.breakpoint(LG),
          crossAxisAlignment: CrossAxisAlignment.start,
          contentPadding: const EdgeInsets.all(16),
          children: [
            if (updates.isNotEmpty)
              Row(
                children: [
                  buildHeader(context, t.installedPage.updatesTitle),
                  const Spacer(),
                  TextButton(
                    onPressed: () => onUpdateAllApps(context, ref),
                    child: Text(
                      t.installedPage.updateAllButton,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            if (updates.isNotEmpty)
              Card(
                clipBehavior: Clip.antiAlias,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: updates.length,
                  itemBuilder: (context, index) {
                    final app = updates[index];
                    return buildCard(
                      context,
                      app,
                      trailing: IconButton(
                        onPressed: () => onUpdateApp(context, ref, app.name),
                        icon: const Icon(
                          Icons.download_outlined,
                          size: 28,
                        ),
                      ),
                    );
                  },
                ),
              ),
            buildHeader(context, t.installedPage.appsTitle),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  final app = apps[index];
                  return buildCard(context, app);
                },
              ),
            ),
            if (runtimes.isNotEmpty)
              buildHeader(context, t.installedPage.runtimesTitle),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: runtimes.length,
                itemBuilder: (context, index) {
                  final app = runtimes[index];
                  return buildCard(context, app);
                },
              ),
            ),
          ],
        );
      },
      error: (_, __) {
        return  Center(
          child: Text(t.installedPage.loadingError),
        );
      },
      loading: () {
        return  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(t.installedPage.checkingForUpdates),
            ],
          ),
        );
      },
    );
  }

  void onUpdateApp(BuildContext context, WidgetRef ref, String appId) {
    CommandTerminalDialog.showUpdateApp(
      context,
      appId,
      onExit: (success) {
        if (success) ref.invalidate(installedAppsWithUpdatesProvider);
      },
    );
  }

  void onUpdateAllApps(BuildContext context, WidgetRef ref) {
    CommandTerminalDialog.showUpdateAll(
      context,
      onExit: (success) {
        if (success) ref.invalidate(installedAppsWithUpdatesProvider);
      },
    );
  }
}
