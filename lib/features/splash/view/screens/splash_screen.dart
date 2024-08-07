import 'package:base_project/core/network/local/shared_pref.dart';
import 'package:base_project/core/network/local/shared_pref_key.dart';
import 'package:base_project/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // context.goNamed(NameRoutes.loginNameRoute);
      _checkToken();
    });
    super.initState();
  }

  Future<void> _checkToken() async {
    final token = SharedPref.getData(SharedPrefKeys.token);
    if (token != null && token.isNotEmpty) {
      context.goNamed(NameRoutes.productNameRoute);
    } else {
      context.goNamed(NameRoutes.loginNameRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Splash Screen'),
      ),
    );
  }
}
