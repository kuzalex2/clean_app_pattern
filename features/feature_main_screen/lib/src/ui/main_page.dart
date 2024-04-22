import 'package:feature_auth/feature_auth.dart' as feature_auth;
import 'package:feature_inbox/feature_inbox.dart' as feature_inbox;
import 'package:feature_notifications/feature_notifications.dart' as feature_notifications;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';

import 'analytics/analytics.dart';
import 'cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(),
      child: const _MainPage(),
    );
  }
}

class _MainPage extends StatelessWidget {
  static const _height = 50.0;
  static const _elevation = 0.0;

  static const _activeColorFilter = ColorFilter.mode(
    KitColors.iconBrand,
    BlendMode.srcIn,
  );
  const _MainPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: const [
              feature_inbox.InboxWidget(),
              feature_notifications.NotificationsWidget(),
              Center(
                child: feature_auth.LogoutWidget(),
              ),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: KitColors.transparent,
              highlightColor: KitColors.transparent,
            ),
            child: NavigationBar(
              selectedIndex: state.currentIndex,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: _height,
              elevation: _elevation,
              backgroundColor: KitColors.transparent,
              indicatorColor: KitColors.transparent,
              surfaceTintColor: KitColors.transparent,
              onDestinationSelected: (index) {
                Analytics.instance.trackNavbarClick(MainPagePageType.values.elementAtOrNull(index));
                context
                    .read<MainPageCubit>()
                    .changePage(MainPagePageType.values.elementAtOrNull(index));
              },
              destinations: [
                const feature_inbox.InboxNavbarDestination(
                  activeColorFilter: _activeColorFilter,
                ),
                const feature_notifications.NotificationsNavbarDestination(
                  activeColorFilter: _activeColorFilter,
                ),
                NavigationDestination(
                  icon: Assets.graphics.avatars.bottomNavigation.normal.svg(),
                  selectedIcon: Assets.graphics.avatars.bottomNavigation.normal
                      .svg(colorFilter: _activeColorFilter),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
