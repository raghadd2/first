import 'package:base_project/core/network/end_points.dart';
import 'package:base_project/core/network/remote/dio_client.dart';
import 'package:base_project/features/user_informaion/model/getuser_model.dart';
import 'package:dartz/dartz.dart';

class UserRepositroy {
  Future<Either<String, GetUserModel>> getUser() async {
    try {
      var dio = DioClient();
      final response = await dio
          .get(
        EndPoints.getProfile,
      )
          .catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });
      final success = GetUserModel.fromJson(response.data);

      return Right(success);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> updateUser(userparameters) async {
    try {
      var dio = DioClient();
      final response = await dio
          .put(
        EndPoints.updateProfile,
        data: userparameters.tojsin(),
      )
          .catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });

      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
