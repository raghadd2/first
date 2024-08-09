import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/features/auth/view/otp_screen/otp_screen.dart';
import 'package:base_project/features/auth/view/signin_screen/signin_screen.dart';
import 'package:base_project/features/cart/view/cart_screen.dart';
import 'package:base_project/features/catgory/view/category_product_screen.dart';
import 'package:base_project/features/catgory/view/catgory_screen.dart';
import 'package:base_project/features/dashboard/view/screens/dashboard_screen.dart';
import 'package:base_project/features/products/view/screen/product_screen.dart';
import 'package:base_project/features/splash/view/screens/splash_screen.dart';
import 'package:base_project/features/user_informaion/view/screens/getuser_screen.dart';
import 'package:base_project/features/user_informaion/view/screens/updateuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigateFirstPagr = GlobalKey<NavigatorState>(debugLabel: 'name');
final _shellNavigatorNotificationSecondPage =
    GlobalKey<NavigatorState>(debugLabel: 'name');
final _shellNavigatorNotificationthirdPage =
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

        GoRoute(
          path: Routes.catgoryProductRoute,
          name: NameRoutes.catgoryProductNameRoute,
          pageBuilder: (context, state) {
            final id = state.pathParameters['id'].toString();
            return NoTransitionPage(child: CatProductScreen(id: id));
          },
        ),

        GoRoute(
          path: Routes.otpRoute,
          name: NameRoutes.otpNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: OtpScreen());
          },
        ),

        GoRoute(
          path: Routes.getuserRoute,
          name: NameRoutes.getuserNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: GetUserScreen());
          },
        ),
        GoRoute(
          path: Routes.updateuserRoute,
          name: NameRoutes.updateuserNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: UpdateUser());
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
            StatefulShellBranch(
              navigatorKey: _shellNavigatorNotificationthirdPage,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.catgoryRoute,
                  name: NameRoutes.catgoryNameRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: CatgoryScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ]);
});
