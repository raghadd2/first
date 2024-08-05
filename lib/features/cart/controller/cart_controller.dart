import 'package:base_project/features/cart/model/cart_model.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider((ref) {
  return CartProvider();
});

class CartProvider extends ChangeNotifier {
  final cart = <int, CartItem>{};

  double get total => cart.values
      .map((item) => item.price * item.quantity)
      .fold(0.0, (a, b) => a + b);

  void addToCart(ProductModel item) {
    if (cart.containsKey(item.id)) {
      cart[item.id]!.quantity++;
    } else {
      cart[item.id] =
          CartItem(item.id.toString(), item.price.toInt(), 1, item.title);
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel item) {
    final itemId = item.id;
    if (cart.containsKey(itemId)) {
      if (cart[itemId]!.quantity > 1) {
        cart[itemId]!.quantity--;
      } else {
        cart.remove(itemId);
      }
      notifyListeners();
    }
  }
}
