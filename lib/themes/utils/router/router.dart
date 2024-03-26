import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/utils/router/fade_transition.dart';
import 'package:give_paw/ui/pages/catalog_page/catalog_page.dart';
import 'package:give_paw/ui/pages/category_page/category_page.dart';
import 'package:give_paw/ui/pages/filter_page/filter_page.dart';
import 'package:give_paw/ui/pages/scaffold_navigation_page.dart';
import 'package:give_paw/ui/pages/splash_screen/splash_screen.dart';
import 'package:give_paw/ui/pages/stories_page/stories_page.dart';
import 'package:give_paw/ui/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
  static final sectionShellKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      observers: [GoRouterObserver()],
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          redirect: (_, __) {
            // if (UserPref.getUserUid != '') {
            // return '/main';
            // } else {
            return '/splash';
            // return '/auth';
            // }
          },
        ),
        StatefulShellRoute.indexedStack(
            pageBuilder: (BuildContext context, GoRouterState state,
                    StatefulNavigationShell navigationShell) =>
                FadeTransitionPage(
                  key: state.pageKey,
                  child: ScaffoldNavPage(navigationShell: navigationShell),
                ),
            branches: [
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                      path: '/catalog',
                      pageBuilder:
                          (BuildContext context, GoRouterState state) =>
                              FadeTransitionPage(
                                  key: state.pageKey,
                                  child: const CatalogPage()),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: navigatorKey,
                          path: ':param',
                          pageBuilder:
                              (BuildContext context, GoRouterState state) {
                            Map<String, dynamic>? map =
                                state.extra as Map<String, dynamic>?;
                            return FadeTransitionPage(
                                key: state.pageKey,
                                child: CategoryPage(map?['title'] ?? 'NULL'));
                          },
                        ),
                      ]),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: '/catalogl',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        FadeTransitionPage(
                            key: state.pageKey, child: const CatalogPage()),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: '/catalokg',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        FadeTransitionPage(
                            key: state.pageKey, child: const CatalogPage()),
                  ),
                ],
              ),
            ]),

        GoRoute(
          path: '/splash',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: const SplashScreen(), key: state.pageKey);
          },
        ),
        GoRoute(
          name: 'filter',
          path: '/filter',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: const FilterPage(), key: state.pageKey);
          },
        ),
        GoRoute(
          name: 'stories',
          path: '/stories',
          pageBuilder: (context, state) {
            return MaterialPage(child: const StoriesPage(), key: state.pageKey);
            // }
          },
        ),
        // GoRoute(
        //   path: '/news',
        //   pageBuilder: (context, state) {
        //     return FadeTransitionPage(
        //         child: NewsPage(routeState: state), key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   path: '/payment_schedule',
        //   pageBuilder: (context, state) {
        //     return FadeTransitionPage(
        //         child: PaymentSchedulePage(routeState: state),
        //         key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   name: 'settings',
        //   path: '/settings',
        //   pageBuilder: (context, state) {
        //     return FadeTransitionPage(
        //         child: SettingsPage(routeState: state), key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   name: 'booking_object',
        //   path: '/booking_object',
        //   pageBuilder: (context, state) {
        //     Map<String, dynamic>? map = state.extra as Map<String, dynamic>?;
        //     return FadeTransitionPage(
        //         child: BookingObjectPage(
        //             isNewObjectPage: map?['is_new_object'],
        //             objectToBook: map?['info'] == null
        //                 ? null
        //                 : ObjectToBook.fromMap(map?['info'])),
        //         key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   name: 'guest_info',
        //   path: '/guest_info',
        //   pageBuilder: (context, state) {
        //     Map<String, dynamic>? map = state.extra as Map<String, dynamic>?;
        //     // if (map?['nav_instant_effect'] != true) {
        //     //  return MaterialPageRoute(builder: builder)
        //     // }
        //     return FadeTransitionPage(
        //         // isInstantEffect: true,
        //         child: GuestInfoPage(
        //             guestModel: map?['info'] == null
        //                 ? null
        //                 : GuestModel.fromMap(map?['info']),
        //             isRegisterGuest: map?["is_register_guest"] ?? false),
        //         key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   name: 'profile',
        //   path: '/profile',
        //   pageBuilder: (context, state) {
        //     return FadeTransitionPage(
        //         child: ProfilePage(routeState: state), key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   name: 'support',
        //   path: '/support',
        //   pageBuilder: (context, state) {
        //     return FadeTransitionPage(
        //         child: SupportPage(routeState: state), key: state.pageKey);
        //   },
        // ),
      ],
      errorBuilder: (context, state) => Scaffold(
          backgroundColor: AppColors.colorWhite,
          appBar: CustomAppBar(
              title: 'Not found page',
              leading: (null, () => context.go('/auth'))),
          body: const Center(child: Text('Not found route'))));
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didPush: $route');
    log('MyTest didPush pref: $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log('MyTest didReplace: $newRoute');
  }
}
