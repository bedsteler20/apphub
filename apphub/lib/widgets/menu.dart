import 'package:auto_route/auto_route.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flux/flux.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FluxMenu(items: [
      FluxMenuItem(
        title: t.settings,
        onClick: () {
          showDialog(
            context: context,
            builder: (context) {
              return const SettingsDialog();
            },
          );
        },
      ),
      FluxMenuItem(
        title: t.about,
        onClick: () {
          showDialog(
            context: context,
            builder: (context) {
              return FluxAboutDialog(
                icon: SvgPicture.asset("assets/icons/app.svg"),
                info: FluxAboutInfo(
                  appName: t.appName,
                  links: {
                    t.aboutMenu.github: "https://github.com/bedsteler20/apphub"
                  },
                  credits: {
                    t.aboutMenu.developers: [
                      "Cameron Dehning",
                    ],
                    t.aboutMenu.designers: [
                      "Cameron Dehning",
                    ],
                    t.aboutMenu.translators: [
                      "Cameron Dehning",
                    ],
                  },
                ),
              );
            },
          );
        },
      ),
    ]);
  }
}

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return Dialog(
      alignment:
          context.width > 400 ? Alignment.center : Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      clipBehavior: Clip.antiAlias,
      insetPadding: context.width > 400
          ? const EdgeInsets.symmetric(vertical: 20)
          : const EdgeInsets.only(top: 100),
      child: Container(
        height: 600,
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FluxDialogTitlebar(
              title: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  t.settings,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              onClose: () => Navigator.of(context).pop(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: context.theme.scaffoldBackgroundColor,
                child: ListTile(
                  title: Text(t.installLocation),
                  subtitle: Text(
                    t.installLocationMessage,
                    style: context.textTheme.bodySmall,
                  ),
                  trailing: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: "user",
                        child: Text(t.user),
                      ),
                      DropdownMenuItem(
                        value: "system",
                        child: Text(t.system),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    alignment: Alignment.center,
                    onChanged: (value) {
                      if (value == null) return;
                      settings.installLocation = value;
                    },
                    value: settings.installLocation,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    underline: const SizedBox(height: 0),
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
