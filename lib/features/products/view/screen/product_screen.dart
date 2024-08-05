import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/features/cart/controller/cart_controller.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          final productProvider = ref.watch(productprovider);

          switch (productProvider.state.requestState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return ListView.builder(
                shrinkWrap: true,
                itemCount: productProvider.state.data.length,
                itemBuilder: (context, index) {
                  final product = productProvider.state.data[index];
                  return Expanded(
                    child: Column(
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          product.price.toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            ref.read(cartProvider).addToCart(product);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Added to Cart'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            case RequestState.error:
              return Center(
                child: Text(productProvider.state.message),
              );
            case RequestState.empty:
              return const Center(
                child: Text('No Data'),
              );
          }
        },
      ),
    );
  }
}
