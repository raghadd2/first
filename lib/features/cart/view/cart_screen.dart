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
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Visibility(
            visible: cartprovider.cart.isNotEmpty,
            replacement: const Center(
              child: Text('Cart is empty'),
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final cartItem = cartprovider.cart.values.toList()[index];
                final product = productProvider.state.data[index];

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
                          maxLines: 2,
                          cartItem.name,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        cartItem.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF00A991)),
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
                              color: Colors.green,
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
                              color: Colors.grey[300],
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: cartprovider.cart.length,
            ),
          ),
        );
      }),
    );
  }
}
