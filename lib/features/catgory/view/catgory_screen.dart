import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/catgory/controller/category_provider.dart';
import 'package:base_project/features/catgory/controller/subcat.dart';
import 'package:base_project/features/catgory/model/catgory_model.dart';
import 'package:base_project/features/catgory/repositry/category_repos.dart';
import 'package:base_project/features/catgory/view/category_product_screen.dart';
import 'package:base_project/features/dashboard/view/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
                  final CatgoryModel item = catgoryProvider.state.data[index];
                  return InkWell(
                    onTap: () {
                      context.pushNamed(
                        NameRoutes.catgoryProductNameRoute,
                        pathParameters: {"id": item.id.toString()},
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(
                          catgoryProvider.state.data[index].imageUrl,
                          height: 100,
                          width: 100,
                        ),
                        Text(catgoryProvider.state.data[index].name)
                      ],
                    ),
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
            default:
              return const SizedBox();
          }
        }));
  }
}
