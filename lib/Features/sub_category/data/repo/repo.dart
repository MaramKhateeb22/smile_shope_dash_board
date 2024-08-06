import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/all_product_for_sub_category_model.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/sub_category_get_all_model.dart';
import 'package:smile_shope_dash_board/core/errors/exception.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class SubCategoryRepositry {
  final ApiConsumer api;
  SubCategoryRepositry({required this.api});

  Future<Either<String, SubCategoryGetAllModel>> subcategoryGetAll() async {
    try {
      final response = await api.get(
        EndPoints.subcategoryGetAll,
      );
      return Right(SubCategoryGetAllModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, List<AllProductForSubCategoryModel>>>
      allProductForSubCategory(String id) async {
    try {
      final response = await api.get(
        EndPoints.allSubCategoryGetproduct(id),
      );
      if (response is List) {
        final subCategoryList = response
            .map((productdsData) =>
                AllProductForSubCategoryModel.fromJson(productdsData))
            .toList();

        // print(
        // "SubCategory of first product is ${subCategoryList[0].subCategoryId}");

        return Right(subCategoryList);
      } else {
        return Left('Expected a list but got ${response.runtimeType}');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
