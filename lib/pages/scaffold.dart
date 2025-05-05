import 'package:auto_route/auto_route.dart';
import 'package:deckhub/router.gr.dart';
import 'package:deckhub/widgets/search_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flux/flux.dart';

@RoutePage()
class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: FluxTitlebar(
        leading: [
          if (router.canPop())
            FluxTitlebarButton(
              icon: Icons.arrow_back,
              onPressed: () => router.back(),
            ),
          if (!router.canPop() || router.currentPath == "/search")
            FluxTitlebarButton(
              icon: Icons.search_rounded,
              onPressed: () => SearchPallet.show(context),
            ),
        ],
        title: context.isScreenSize(SM)
            ? showTabSwitcher
                ? FluxTabSwitcher(
                    tabs: const [
                      FluxTab(title: "Home", icon: Icons.home),
                      FluxTab(title: "Installed", icon: Icons.apps),
                    ],
                    onTabChanged: onTabChanged,
                    selectedTab: tabIndex,
                  )
                : null
            : null,
      ),
      body: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.keyF, control: true): () =>
              SearchPallet.show(context),
        },
        child: const AutoRouter(),
      ),
      bottomNavigationBar: context.isScreenSize(SM)
          ? null
          : BottomNavigationBar(
              currentIndex: tabIndex,
              onTap: onTabChanged,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: "Installed",
                ),
              ],
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
