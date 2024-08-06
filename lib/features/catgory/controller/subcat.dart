import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/general_state.dart';
import 'package:base_project/features/catgory/controller/category_provider.dart';
import 'package:base_project/features/catgory/repositry/category_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sucategoryProvider = ChangeNotifierProvider.family((ref, String id) {
  return SubcategoryProvider(id);
});

class SubcategoryProvider extends ChangeNotifier {
  SubcategoryProvider(String id) {
    getCategoryProducts(id);
  }

  GeneralState state = GeneralState(requestState: RequestState.loading);
  var repo = CategoryProductRepos();
  getCategoryProducts(String id) async {
    final result = await repo.getCategoryProducts(id);
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
