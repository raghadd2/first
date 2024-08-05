
import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/features/cart/view/cart_screen.dart';
import 'package:base_project/features/dashboard/view/screens/dashboard_screen.dart';
import 'package:base_project/features/login/view/login_screen.dart';
import 'package:base_project/features/products/view/screen/product_screen.dart';
import 'package:base_project/features/splash/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigateFirstPagr = GlobalKey<NavigatorState>(debugLabel: 'name');
final _shellNavigatorNotificationSecondPage =
    GlobalKey<NavigatorState>(debugLabel: 'name');

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        print("Current Route: ${state.matchedLocation}");

        if (state.matchedLocation == Routes.splashRoute) {
          return Routes.splashRoute;
        }

        print("Final Route after redirection: ${state.matchedLocation}");

        return null;
      },
      initialLocation: Routes.splashRoute,
      routes: [
        GoRoute(
          path: Routes.splashRoute,
          name: NameRoutes.splashNameRoute,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: SplashScreen());
          },
        ),

        GoRoute(
          path: Routes.logintRoute,
          name: NameRoutes.loginNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: LoginScreen());
          },
        ),

        // SHELL NAVIGATOR

        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashBoardScreen(navigatorShellKey: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              navigatorKey: _shellNavigateFirstPagr,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.productRoute,
                  name: NameRoutes.productNameRoute,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: ProductScreen());
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorNotificationSecondPage,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.cartRoute,
                  name: NameRoutes.cartNameRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: CartScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ]);
});
