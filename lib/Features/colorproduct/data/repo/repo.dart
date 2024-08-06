import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/add_model_color.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/all_model_color.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/delete_model_color.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/edit_model_color.dart';
import 'package:smile_shope_dash_board/core/errors/exception.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class ColorRepo {
  final ApiConsumer api;
  ColorRepo({required this.api});

  Future<Either<String, ColorDeleteModel>> colorDlelte(String id) async {
    try {
      final response = await api.post(
        EndPoints.deleteColor(id),
      );
      print(" The Response Is : \n \n" '$response');
      return Right(ColorDeleteModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, AddColorModel>> addColor(
    String colorName,
  ) async {
    try {
      final response = await api.post(EndPoints.addColor, data: {
        "color_name": colorName,
      });
      // print("The Response Is : \n \n" '$response');
      return Right(AddColorModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, AllColorModel>> colorGetAll() async {
    try {
      final response = await api.get(
        EndPoints.colortGetAll,
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
      return Right(AllColorModel?.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, EditColorModel>> editColor(
      {required String colorName, required String id}) async {
    try {
      final response = await api.post(EndPoints.editColor(id), data: {
        "color_name": colorName,
      });
      print(" The Response Is : \n \n" '$response');
      return Right(EditColorModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
