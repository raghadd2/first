import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(productprovider);
            switch (provider.state.requestState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return ListView.builder(
                    itemCount: provider.state.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(provider.state.data[index].title),
                        subtitle:
                            Text(provider.state.data[index].price.toString()),
                      );
                    });
              case RequestState.error:
                return Center(
                  child: Text(provider.state.message),
                );
              case RequestState.empty:
                return Center(
                  child: Text('No Data'),
                );
            }
          },
        ));
  }
}
