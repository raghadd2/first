import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/general_state.dart';
import 'package:base_project/features/catgory/repositry/category_repos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = ChangeNotifierProvider(
  (ref) {
    return CategoryProvider();
  },
);

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    getCategories();
  }

  GeneralState state = GeneralState(requestState: RequestState.empty);
  var _repo = CategoryRepos();
  getCategories() async {
    state = GeneralState(requestState: RequestState.loading);

    final result = await _repo.getCategories();
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
