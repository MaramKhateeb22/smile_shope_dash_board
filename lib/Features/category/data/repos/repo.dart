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

  Future<Either<String, List<GetAllSubCatForOneCatModel>>>
      categoryGetAllSubCategory(String id) async {
    try {
      final response = await api.get(
        EndPoints.categoryGetAllSubCategory(id),
      );
      if (response is List) {
        final subCategoryList = response
            .map((CategoryData) =>
                GetAllSubCatForOneCatModel.fromJson(CategoryData))
            .toList();

        print("Category of first product is ${subCategoryList[0].title2}");

        return Right(subCategoryList);
      } else {
        return Left('Expected a list but got ${response.runtimeType}');
      }
      // return Right(GetAllSubCatForOneCatModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  // Future<Either<String, List<CategoryGetAllModle>>> categoryGetAll() async {
  //   try {
  //     final response = await api.get(
  //       EndPoints.categoryGetAll,
  //     );
  //     if (response is List) {
  //       final categoryList = response
  //           .map((productData) => CategoryGetAllModle.fromJson(productData))
  //           .toList();

  //       print("Category of first product is ${categoryList[0].massege}");

  //       return Right(categoryList);
  //     } else {
  //       return Left('Expected a list but got ${response.runtimeType}');
  //     }
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage);
  //   }
  // }

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
