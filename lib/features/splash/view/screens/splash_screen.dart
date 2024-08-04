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
      context.goNamed(NameRoutes.defaultNameRoute);
    });
    super.initState();
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
