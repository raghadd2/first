import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/app_validation.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/user_informaion/controller/getuser_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UpdateUser extends ConsumerStatefulWidget {
  const UpdateUser({super.key});

  @override
  ConsumerState<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends ConsumerState<UpdateUser> {
  @override
  void initState() {
    super.initState();
    final userProvider = ref.read(getUserProvider);
    final user = userProvider.state.data;
    ref.read(updateuserProvider).nameController.text = user.name;
    ref.read(updateuserProvider).emailController.text = user.email;
    ref.read(updateuserProvider).homephoneController.text = user.homePhone;
    ref.read(updateuserProvider).workphoneController.text = user.workPhone;
    ref.read(updateuserProvider).jobController.text = user.job;
    ref.read(updateuserProvider).nationalityController.text = user.nationality;
    ref.read(updateuserProvider).maritalstatusController.text =
        user.maritalStatus;
    ref.read(updateuserProvider).birthdayController.text = user.birthday;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update User Information'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: ((context, ref, child) {
              final provider = ref.watch(updateuserProvider);
              return Column(children: [
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
                      AppValidation.validateName(context, value ?? ""),
                  controller: provider.emailController,
                  decoration: InputDecoration(
                    hintText: 'email',
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                20.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 170,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: (value) => AppValidation.validatePhoneNumber(
                            context, value ?? ""),
                        controller: provider.homephoneController,
                        decoration: InputDecoration(
                          hintText: 'homephone',
                          suffixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: (value) => AppValidation.validatePhoneNumber(
                            context, value ?? ""),
                        controller: provider.workphoneController,
                        decoration: InputDecoration(
                          hintText: 'workphone',
                          suffixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),
                  ],
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
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: provider.nationalityController,
                  decoration: InputDecoration(
                    hintText: 'Nationality',
                    suffixIcon: Icon(Icons.flag),
                  ),
                ),
                20.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 170,
                      child: DropdownButtonFormField<String>(
                        value: provider.maritalstatusController.text.isNotEmpty
                            ? provider.maritalstatusController.text
                            : null,
                        onChanged: (newValue) {
                          provider.maritalstatusController.text = newValue!;
                        },
                        items: ['Married', 'Single'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          hintText: 'Marital Status',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: TextFormField(
                        controller: provider.birthdayController,
                        decoration: const InputDecoration(
                          hintText: 'Birthday',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            provider.birthdayController.text = formattedDate;
                          }
                        },
                      ),
                    ),
                  ],
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
          ),
        )));
  }
}
