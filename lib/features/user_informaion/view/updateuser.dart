import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/app_validation.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/user_informaion/controller/getuser_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateUser extends StatelessWidget {
  const UpdateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update User Information'),
        ),
        body: SingleChildScrollView(child: Consumer(
          builder: ((context, ref, child) {
            final provider = ref.watch(updateuserProvider);
            return Column(children: [
              const SizedBox(height: 16.0),
              16.hGap,
              TextFormField(
                textInputAction: TextInputAction.done,
                validator: (value) =>
                    AppValidation.validateName(context, value ?? ""),
                controller: provider.nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              20.hGap,
              TextFormField(
                textInputAction: TextInputAction.done,
                validator: (value) =>
                    AppValidation.validatePhoneNumber(context, value ?? ""),
                controller: provider.workphoneController,
                decoration: InputDecoration(
                  hintText: 'workphone',
                  suffixIcon: Icon(Icons.phone),
                ),
              ),
              20.hGap,
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: provider.nationalityController,
                decoration: InputDecoration(
                  hintText: 'Nationality',
                  suffixIcon: Icon(Icons.flag),
                ),
              ),
              20.hGap,
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: provider.jobController,
                decoration: InputDecoration(
                  hintText: 'Job',
                  suffixIcon: Icon(Icons.work),
                ),
              ),
              20.hGap,
              provider.genstate.requestState == RequestState.loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        provider.updateuser(context);
                      },
                      child: const Text('Update'),
                    ),
            ]);
          }),
        )));
  }
}
