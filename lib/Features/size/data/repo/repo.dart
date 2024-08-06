import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/add_model_size.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/all_model_size.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/delete_model.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/edit_model_size.dart';
import 'package:smile_shope_dash_board/core/errors/exception.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class SizeRepo {
  final ApiConsumer api;
  SizeRepo({required this.api});

  Future<Either<String, SizeDeleteModel>> sizeDlelte(String id) async {
    try {
      final response = await api.post(
        EndPoints.deleteSize(id),
      );
      print(" The Response Is : \n \n" '$response');
      return Right(SizeDeleteModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, AddSizeModel>> addSize(
    String sizeName,
  ) async {
    try {
      final response = await api.post(EndPoints.addSize, data: {
        "size_name": sizeName,
      });
      // print("The Response Is : \n \n" '$response');
      return Right(AddSizeModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, AllSizeModel>> sizeGetAll() async {
    try {
      final response = await api.get(
        EndPoints.sizetGetAll,
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
      // print(" 5555555555" '$response');
      return Right(AllSizeModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, EditSizeModel>> editSize(
      {required String sizeName, required String id}) async {
    try {
      final response = await api.post(EndPoints.editSize(id), data: {
        "size_name": sizeName,
      });
      print(" The Response Is : \n \n" '$response');
      return Right(EditSizeModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
