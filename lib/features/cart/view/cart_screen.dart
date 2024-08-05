import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/cart/controller/cart_provider.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final productProviderState = ref.watch(productprovider);
        final cartProviderState = ref.watch(cartProvider);

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Visibility(
            visible: cartProviderState.cart.isNotEmpty,
            replacement: const Center(
              child: Text('Cart is empty'),
            ),
            child: Column(
              children: [
                if (cartProviderState.cart.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final cartItem =
                            cartProviderState.cart.values.toList()[index];
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network(
                                cartItem.img,
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  cartItem.name,
                                  maxLines: 2,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .addToCart(cartItem.id, ref);

                                          
                                          // old call method to make it work

                                          // ref
                                          //     .read(cartProvider)
                                          //     .oldAdd(ProductModel(
                                          //       id: cartItem.id,
                                          //       title: cartItem.name,
                                          //       price: cartItem.price,
                                          //       description: cartItem.name,
                                          //       category: "",
                                          //       image: cartItem.img,
                                          //     ));
                                        },
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        cartItem.quantity.toString(),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .removeFromCart(cartItem.id);
                                        },
                                        child: Icon(
                                          Icons.remove_circle,
                                          color: Colors.grey[300],
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\$${cartItem.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF00A991),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: cartProviderState.cart.length,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    Text(
                      "\$${cartProviderState.total.round()}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
