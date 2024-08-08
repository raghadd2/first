import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/user_informaion/controller/getuser_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GetUserScreen extends StatelessWidget {
  const GetUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Information'),
        ),
        body: SingleChildScrollView(
          child: Consumer(builder: ((context, ref, child) {
            final userProvider = ref.watch(getUserProvider);
            final user = userProvider.state.data;
            switch (userProvider.state.requestState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              context.pushNamed(NameRoutes.updateuserNameRoute);
                            },
                            child: const Text('Edit'),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        16.hGap,
                        Text(
                          user.name,
                          style: context.text.titleMedium,
                        ),
                        8.hGap,
                        Text(
                          user.phone,
                          style: context.text.titleMedium,
                        ),
                        8.hGap,
                        Text(
                          user.nationality,
                          style: context.text.titleMedium,
                        ),
                        8.hGap,
                        Text(
                          user.maritalStatus,
                          style: context.text.titleMedium,
                        ),
                        8.hGap,
                        Text(
                          user.job,
                          style: context.text.titleMedium,
                        ),
                        8.hGap,
                        Text(
                          user.homePhone,
                          style: context.text.titleMedium,
                        ),
                        8.hGap,
                        Text(
                          user.workPhone,
                          style: context.text.titleMedium,
                        ),
                        8.hGap,
                        ElevatedButton(
                          onPressed: () {
                            userProvider.signOut(context);
                          },
                          child: const Text('Sign Out'),
                        ),
                      ],
                    ),
                  ),
                );
              case RequestState.error:
                print(userProvider.state.message);
                return Center(
                  child: Text(userProvider.state.message),
                );
              default:
                return const SizedBox();
            }
          })),
        ));
  }
}
