import 'package:base_project/features/cart/controller/cart_provider.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final productProvider = ref.watch(productprovider);
        final cartprovider = ref.watch(cartProvider);
        return Visibility(
          visible: cartprovider.cart.isNotEmpty,
          replacement: const Center(
            child: Text('Cart is empty'),
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final cartItem = cartprovider.cart.values.toList()[index];
              final product = productProvider.state.data[index];
              return Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        cartItem.img ,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          cartItem.name,
                        ),
                      ),
                      Text(
                        cartItem.price.toString(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              ref.read(cartProvider).addToCart(product);
                            },
                          
                            child: Icon(
                              Icons.add_circle,
                            ),
                          ),
                          Text(
                            cartItem.quantity.toString(),
                          ),
                          InkWell(
                            onTap: () {
                              cartprovider.removeFromCart(product);
                            },
                            child: Icon(
                              Icons.remove_circle,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]);
            },
            itemCount: cartprovider.cart.length,
          ),
        );
      }),
    );
  }
}
