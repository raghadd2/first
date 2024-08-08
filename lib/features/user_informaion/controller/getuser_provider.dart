import 'package:base_project/core/network/local/shared_pref.dart';
import 'package:base_project/core/network/local/shared_pref_key.dart';
import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/routes/route_provider.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/general_state.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:base_project/features/user_informaion/repositry/getuser_repository.dart';
import 'package:base_project/features/user_informaion/repositry/userparameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final getUserProvider = ChangeNotifierProvider((ref) => User());
final updateuserProvider = ChangeNotifierProvider((ref) => User());

class User extends ChangeNotifier {
  User() {
    fetchUser();
  }

  GeneralState state = GeneralState(requestState: RequestState.empty);
  final _repo = UserRepositroy();
  final update = UserRepositroy();
  var genstate = GeneralState(requestState: RequestState.empty);
  var genstate1 = GeneralState(requestState: RequestState.empty);
  var key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final workphoneController = TextEditingController();
  final homephoneController = TextEditingController();
  final nationalityController = TextEditingController();
  final maritalstatusController = TextEditingController();
  final jobController = TextEditingController();
  final birthdayController = TextEditingController();
  final emailController = TextEditingController();

  fetchUser() async {
    state = GeneralState(requestState: RequestState.loading);
    notifyListeners();

    final result = await _repo.getUser();
    result.fold((error) {
      state = GeneralState(
        requestState: RequestState.error,
        message: error,
      );
    }, (user) {
      state = GeneralState(
        requestState: RequestState.loaded,
        data: user,
      );
    });
    notifyListeners();
  }

  updateuser(BuildContext context) async {
    if (!key.currentState!.validate()) return;
    changeState(RequestState.loading);
    final result = await update.updateUser(
      Userparameters(
          name: nameController.text,
          homephone: homephoneController.text,
          workphone: workphoneController.text,
          nationality: nationalityController.text,
          maritalstatus: maritalstatusController.text,
          job: jobController.text,
          birthday: birthdayController.text,
          email: emailController.text),
    );
    result.fold((error) {
      PublicMethods.displaySnackBar(context: context, message: error);
      genstate1 =
          GeneralState(requestState: RequestState.error, message: error);
    }, (data) {
      genstate1 = GeneralState(requestState: RequestState.loaded);
      context.pushNamed(NameRoutes.otpNameRoute);
    });
    notifyListeners();
  }

  void changeState(RequestState requestState) {
    genstate1 = GeneralState(requestState: requestState);
    notifyListeners();
  }

  Future<void> signOut(BuildContext context) async {
    await SharedPref.removeData(SharedPrefKeys.token);

    context.pushNamed(NameRoutes.loginNameRoute);
  }
}
