import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_model.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

import '../../../../core/errors/exception.dart';



class CategoryRepositry {
  final ApiConsumer api;
  CategoryRepositry({required this.api});

  Future<Either<String,CategoryGetAllModle>> categoryGetAll() async {
    try {
      final response = await api.get(
        EndPoints.categoryGetAll,
      );

      return Right(CategoryGetAllModle.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
