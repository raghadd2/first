import 'package:base_project/core/utils/app_validation.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(loginprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: provider.key,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Login Screen'),
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) =>
                  AppValidation.validatePhoneNumber(context, value ?? ""),
              controller: provider.phoneController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            provider.genstate.requestState == RequestState.loading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      provider.login(context);
                    },
                    child: const Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
