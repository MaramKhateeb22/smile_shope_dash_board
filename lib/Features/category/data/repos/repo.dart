import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_Sub_Category_model.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_model.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_delete_model.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

import '../../../../core/errors/exception.dart';

class CategoryRepositry {
  final ApiConsumer api;
  CategoryRepositry({required this.api});

  Future<Either<String, CategoryGetAllModle>> categoryGetAll() async {
    try {
      final response = await api.get(
        EndPoints.categoryGetAll,
      );

      return Right(CategoryGetAllModle.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, GetAllSubCatForOneCatModel>> categoryGetAllSubCategory(
      String id) async {
    try {
      final response = await api.get(
        EndPoints.categoryGetAllSubCategory(id),
      );

      return Right(GetAllSubCatForOneCatModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, DeleteCategoryModel>> categoryDelete(String id) async {
    try {
      final response = await api.post(
        EndPoints.deleteCategory(id),
      );
      print(" The Response Is : \n \n" '$response');
      return Right(DeleteCategoryModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
