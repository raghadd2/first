import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/routes/route_provider.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/theme/app_assets.dart';
import 'package:base_project/features/auth/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Consumer(builder: (context, ref, child) {
        var provider = ref.watch(loginprovider);
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.otpImg),
                30.hGap,
                Text(
                  "تسجيل الدخول",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black87)
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                5.hGap,
                Text(
                  "اهلا بك في تطبيق المراقب",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.black54),
                ),
                30.hGap,
                Pinput(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء ادخال رمز التحقق';
                    }
                    return null;
                  },
                  controller: provider.otpController,
                  length: 4,
                  autofocus: true,
                  defaultPinTheme: PinTheme(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    width: 50,
                    height: 50,
                  ),
                ),
                10.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "لم يصلك رمز التحقق؟",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      "اعادة المحاولة",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                5.hGap,
                provider.genstate.requestState == RequestState.loading
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff2C3091)),
                          ),
                          onPressed: () async {
                            await provider.checkOtp(context);
                          },
                          child: Text(
                            "تأكد من الرمز",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      }),
    );
  }
}
