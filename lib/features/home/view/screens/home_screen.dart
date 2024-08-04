import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/routes/route_provider.dart';
import 'package:base_project/core/utils/app_constance.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/app_validation.dart';
import 'package:base_project/core/utils/language_provider.dart';
import 'package:base_project/core/utils/theme_provider.dart';
import 'package:base_project/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.tr.home),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              30.hGap,
              const Text("is Arabic"),
              context.locale == AppConstance.arLang
                  ? const Icon(Icons.check)
                  : const Icon(Icons.close),
              30.hGap,
              Consumer(
                builder: (context, ref, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(langProvider.notifier)
                                    .changeLanguage(AppConstance.arLang);
                              },
                              child: const Text(AppConstance.arLang))),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(langProvider.notifier)
                                    .changeLanguage(AppConstance.enLang);
                              },
                              child: const Text(AppConstance.enLang))),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(themeProvider.notifier)
                                    .changeTheme(ThemeMode.dark);
                              },
                              child: const Text("dark"))),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(themeProvider.notifier)
                                    .changeTheme(ThemeMode.light);
                              },
                              child: const Text('light'))),
                    ],
                  );
                },
              ),
              100.hGap,
              Container(
                width: context.width,
                height: context.height * .12,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    context.tr.home,
                    style: context.text.displayLarge,
                  ),
                ),
              ),
              30.hGap,
              TextFormField(
                validator: (value) =>
                    AppValidation.fieldRequired(context, value ?? ""),
              ),
              30.hGap,
            
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(NameRoutes.loginNameRoute);
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ));
  }
}
