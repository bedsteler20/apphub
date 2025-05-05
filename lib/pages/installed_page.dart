import 'package:auto_route/auto_route.dart';
import 'package:deckhub/native/flatpak.dart';
import 'package:deckhub/providers/flatpak.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/utils/std.dart';
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
              ? Image.file((app.icon!))
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
    final installedApps = ref.watch(installedAppsProvider);
    final filtered = installedApps.unique((app) => app.name).toList();
    final installedAppsWithUpdates =
        ref.watch(installedAppsWithUpdatesProvider);

    if (installedAppsWithUpdates.isLoading) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Checking for updates..."),
          ],
        ),
      );
    }

    final withUpdates = (installedAppsWithUpdates.value ?? [])
        .where((app) => app.kind == FlatpakRefKind.app)
        .toList();
    final runtimes =
        filtered.where((app) => app.kind == FlatpakRefKind.runtime).toList();
    final apps =
        filtered.where((app) => app.kind == FlatpakRefKind.app).toList();

    return PageContentLayout(
      width: context.breakpoint(LG),
      crossAxisAlignment: CrossAxisAlignment.start,
      contentPadding: const EdgeInsets.all(16),
      children: [
        if (withUpdates.isNotEmpty) buildHeader(context, "Updates"),
        if (withUpdates.isNotEmpty)
          Card(
            clipBehavior: Clip.antiAlias,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: withUpdates.length,
              itemBuilder: (context, index) {
                final app = withUpdates[index];
                return buildCard(
                  context,
                  app,
                  trailing: FilledButton(
                    onPressed: () => onUpdateApp(context, ref, app.name),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        context.colorScheme.primary,
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                      ),
                    ),
                    child: const Icon(
                      Icons.download_outlined,
                      size: 32,
                    ),
                  ),
                );
              },
            ),
          ),
        buildHeader(context, "Apps"),
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
        if (runtimes.isNotEmpty) buildHeader(context, "Runtimes"),
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
}
