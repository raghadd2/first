import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/routes/route_provider.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:base_project/features/cart/controller/cart_provider.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(NameRoutes.getuserNameRoute);
            },
            icon: const Icon(Icons.account_circle),
            iconSize: 50,
          )
        ],
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
              return GridView.builder(
                shrinkWrap: true,
                itemCount: productProvider.state.data.length,
                itemBuilder: (context, index) {
                  final ProductModel product =
                      productProvider.state.data[index];
                  return Column(
                    children: [
                      Image.network(
                        product.image,
                        width: 70,
                        height: 70,
                      ),
                      Text(
                        maxLines: 3,
                        product.title,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        " ${product.price}\$",
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              ref.read(cartProvider).addToCart(product.id, ref);
                              PublicMethods.displaySnackBar(
                                  color: Colors.green,
                                  context: context,
                                  message: 'Added to cart');
                            },
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(cartProvider).removeFromCart(product.id);
                            },
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.grey[300],
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.8),
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
