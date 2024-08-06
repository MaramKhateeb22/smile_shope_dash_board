import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/users/data/models/all_users_model.dart';
import 'package:smile_shope_dash_board/Features/users/data/models/number_users_model.dart';
import 'package:smile_shope_dash_board/core/errors/exception.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class UsersRepositry {
  final ApiConsumer api;
  UsersRepositry({required this.api});

  Future<Either<String, AllUsersModel>> usersGetAll() async {
    try {
      final response = await api.get(
        EndPoints.allUsers,
      );

      return Right(AllUsersModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, NumberUserModel>> numberUsers() async {
    try {
      final response = await api.get(
        EndPoints.numberusers,
      );

      return Right(NumberUserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
