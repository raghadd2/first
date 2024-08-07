import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/app_validation.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/theme/app_assets.dart';
import 'package:base_project/features/auth/controller/login_controller.dart';
import 'package:base_project/generated/intl/messages_ar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginprovider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: 22.horPad,
          child: Form(
            key: provider.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(AppImages.otpImg),
                24.hGap,
                Text('تسجيل الدخول', style: context.text.headlineMedium),
                8.hGap,
                Text(
                  'اهلا بك في تطبيق المراقب',
                  style: context.text.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                24.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      validator: (value) => AppValidation.validatePhoneNumber(
                          context, value ?? ""),
                      controller: provider.phoneController,
                      decoration: InputDecoration(
                        hintText: 'رقم الهاتف',
                        suffixIcon: Icon(Icons.phone),
                      ),
                    ),
                    20.hGap,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
