import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/catgory/controller/category_provider.dart';
import 'package:base_project/features/catgory/model/catgory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatgoryScreen extends StatelessWidget {
  const CatgoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catgory'),
        ),
        body: Consumer(builder: (context, ref, child) {
          final catgoryProvider = ref.watch(categoryProvider);
          switch (catgoryProvider.state.requestState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return GridView.builder(
                shrinkWrap: true,
                itemCount: catgoryProvider.state.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        catgoryProvider.state.message,
                   
                      ),
                    ],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 0.7,
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(catgoryProvider.state.message),
              );
            case RequestState.empty:
              return Center(
                child: Text('No Data'),
              );
            default:
              return const SizedBox();
          }
        }));
  }
}
