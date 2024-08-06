import 'package:base_project/core/network/end_points.dart';
import 'package:base_project/core/network/remote/dio_client.dart';
import 'package:base_project/features/catgory/model/catgory_model.dart';
import 'package:dartz/dartz.dart';

class CategoryRepos {
  Future<Either<String, List<CatgoryModel>>> getCategories() async {
    try {
      final dio = DioClient();

      final response = await dio.get(EndPoints.category).catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });

      final success =
          (response.data as List).map((e) => CatgoryModel.fromJson(e)).toList();

      return Right(success);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
