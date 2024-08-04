import 'package:base_project/core/network/end_points.dart';
import 'package:base_project/core/network/remote/dio_client.dart';
import 'package:base_project/features/login/login_repo/product_params.dart';
import 'package:base_project/features/login/model/login_model.dart';
import 'package:dartz/dartz.dart';

class Logirepo {
  Future<Either<String, LoginModel>> login(LoginParmas params) async {

    try {

      var dio = DioClient();
      final response = await dio.post(EndPoints.categories,
          queryParameters: params.tojsin()).catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });
      var sucess = LoginModel.fromJson(response.data['data']);
      return Right(sucess);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

List<int> x = [2];
