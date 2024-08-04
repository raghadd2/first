import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/general_state.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:base_project/features/login/login_repo/login_repositry.dart';
import 'package:base_project/features/login/login_repo/product_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginprovider = ChangeNotifierProvider((ref) {
  return Login_Notifier();
});

class Login_Notifier extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final logrepo = Logirepo();
  var genstate = GeneralState(requestState: RequestState.empty);
  var key = GlobalKey<FormState>();

  login(BuildContext context) async {
    if (!key.currentState!.validate()) return;
    changeState(RequestState.loading);
    final result =
        await logrepo.login(LoginParmas(phone: phoneController.text));
    result.fold((error) {
      
      PublicMethods.displaySnackBar(context: context, message: error);
      genstate = GeneralState(requestState: RequestState.error, message: error);
    }, (data) {
      genstate = GeneralState(requestState: RequestState.loaded);
    });
    notifyListeners();
  }

  void changeState(RequestState requestState) {
    genstate = GeneralState(requestState: requestState);
    notifyListeners();
  }
}
