import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_delete_modle.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/core/errors/exception.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class ProductRepo {
  final ApiConsumer api;
  ProductRepo({required this.api});

  Future<Either<String, ProductDeleteModel>> productDelete(String id) async {
    try {
      final response = await api.post(
        EndPoints.deleteProduct(id),
      );
      print(" The Response Is : \n \n" '$response');
      return Right(ProductDeleteModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, ProductGetAllModel>> productGetAll() async {
    try {
      final response = await api.get(
        EndPoints.productGetAll,
      );
      // if (response is List) {
      //   final ProductList = response
      //       .map((productData) => ProductGetAllModel.fromJson(productData))
      //       .toList();

      //   print("Category of first product is ${ProductList[0].massege}");

      //   return Right(ProductList);
      // } else {
      //   return Left('Expected a list but got ${response.runtimeType}');
      // }
      print(" 5555555555" '$response');
      return Right(ProductGetAllModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
