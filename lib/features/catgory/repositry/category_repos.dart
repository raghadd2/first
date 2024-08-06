import 'package:base_project/core/network/end_points.dart';
import 'package:base_project/core/network/remote/dio_client.dart';
import 'package:base_project/features/catgory/model/catgory_model.dart';
import 'package:base_project/features/catgory/model/catgory_product_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:developer';

class CategoryRepos {
  Future<Either<String, List<CatgoryModel>>> getCategories() async {
    try {
      final dio = DioClient();

      final response = await dio
          .get(
        EndPoints.category,
        // queryParameters: "ParentId"
      )
          .catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });

      final success = (response.data['result'] as List)
          .map((e) => CatgoryModel.fromJson(e))
          .toList();

      return Right(success);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class CategoryProductRepos {
  Future<Either<String, List<CatgoryproductModel>>> getCategoryProducts(
      id) async {
    try {
      final dio = DioClient();

      final response = await dio.get(EndPoints.categoryProducts,
          queryParameters: {"ParentId": id}).catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });

      final data = response.data;
      List<dynamic> categoryList;

      categoryList = data['result'];

      final success =
          categoryList.map((e) => CatgoryproductModel.fromJson(e)).toList();

      return Right(success);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
