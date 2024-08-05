import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/dashboard/controller/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavBarWidget extends ConsumerWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(dashboardProvider);
    return Container(
      color: Colors.blue,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            padding: 30.allPad,
            icon: const Icon(Icons.home),
            onPressed: () {
              if (index == 0) return;
              ref.watch(dashboardProvider.notifier).changeIndex(0);
              context.goNamed(NameRoutes.productNameRoute);
            },
          ),
          IconButton(
            padding: 30.allPad,
            icon: const Icon(Icons.search),
            onPressed: () {
              if (index == 1) return;

              ref.watch(dashboardProvider.notifier).changeIndex(1);
              context.goNamed(NameRoutes.cartNameRoute);
            },
          ),
        ],
      ),
    );
  }
}
