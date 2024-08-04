import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/general_state.dart';
import 'package:base_project/features/products/repo/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productprovider = ChangeNotifierProvider((ref) {
  return ProductProvider();
});


class ProductProvider extends ChangeNotifier {
ProductProvider() {
    fetchProduct();
  }
  GeneralState state = GeneralState(requestState: RequestState.empty);
  var _repo = ProductRepo();
  fetchProduct() async {
    state = GeneralState(requestState: RequestState.loading);
    
    final result = await _repo.getProducts();
    result.fold((error) {
      return state = GeneralState(
        requestState: RequestState.error,
        message: error,
      );
    }, (data) {
      return state = GeneralState(
        requestState: RequestState.loaded,
        data: data,
      );
    });
    notifyListeners();
  }
}
