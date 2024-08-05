import 'package:base_project/features/cart/controller/cart_controller.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final cartController = ref.watch(cartProvider);
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final cartItem = cartController.cart.values.toList()[index];
            // final item  = ref.watch(productprovider).firstWhere((item) => item.id == cartItem.id);
            return Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartItem.name,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // cartController.addToCart(item);
                    },
                    overlayColor: const MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    child: Icon(
                      Icons.add_circle,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // cartController.removeFromCart(item);
                    },
                    child: Icon(
                      Icons.remove_circle,
                      size: 30,
                    ),
                  ),
                ],
              )
            ]);
          },
          itemCount: cartController.cart.length,
        );
      }),
    );
  }
}
