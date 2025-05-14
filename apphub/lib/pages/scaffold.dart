import 'package:auto_route/auto_route.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/widgets/search_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flux/flux.dart';

@RoutePage()
class ScaffoldPage extends HookWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationKey = useMemoized(() => GlobalKey<NavigatorState>());
    final router = context.watchRouter;
    final showTabSwitcher =
        router.currentPath == "/" || router.currentPath == "/installed";
    final tabIndex = router.currentPath == "/installed" ? 1 : 0;

    void onTabChanged(int index) {
      if (index == 0) {
        router.replaceAll([const HomeRoute()]);
      } else {
        router.replaceAll([const InstalledAppsRoute()]);
      }
    }

    return FluxScaffold(
      onTabSelected: onTabChanged,
      selectedTab: tabIndex,
      showTabSwitcher: showTabSwitcher,
      titlebarLeading: [
        if (router.canPop())
          FluxTitlebarButton(
            icon: Icons.arrow_back,
            onPressed: () {
              navigationKey.currentState?.maybePop();
            },
          ),
        if (!router.canPop() || router.currentPath == "/search")
          FluxTitlebarButton(
            icon: Icons.search_rounded,
            onPressed: () => SearchPallet.show(context),
          ),
      ],
      tabs: [
        FluxTab(title: t.tabBar.home, icon: Icons.home),
        FluxTab(title: t.tabBar.installed, icon: Icons.apps),
      ],
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.keyF, control: true): () =>
              SearchPallet.show(context),
        },
        child: AutoRouter(
          navigatorKey: navigationKey,
        ),
      ),
    );
  }
}

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        HomeRoute(),
        InstalledAppsRoute(),
      ],
      builder: (context, child, tabController) {
        return child;
      },
    );
  }
}
