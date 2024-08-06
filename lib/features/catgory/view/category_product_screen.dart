import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/catgory/controller/category_provider.dart';
import 'package:base_project/features/catgory/model/catgory_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatProductScreen extends StatelessWidget {
  const CatProductScreen({super.key, this.catgoryModel});
  final CatgoryproductModel? catgoryModel;

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
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(
                        catgoryModel!.productImages[index].imageUrl,
                        height: 100,
                        width: 100,
                      ),
                      Text(catgoryModel!.name),
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
                child: InkWell(
                  onTap: () {
                    print(catgoryProvider.state.message);
                  },
                  child: Text('Error'),
                ),
              );
            case RequestState.empty:
              return Center(
                child: Text('No Data'),
              );
          }
        }));
  }
}
