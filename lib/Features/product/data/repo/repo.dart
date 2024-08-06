import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/edit_prodcut_model.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_add_model';
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

  Future<Either<String, AddPrdouctModel>> productAdd(
      String price,
      String detail,
      String image,
      String subCategoryId,
      String productName) async {
    try {
      final response = await api.post(EndPoints.addProduct, data: {
        "product_name": productName,
        "product_price": price,
        "detail": detail,
        // لإرسال صورة، قد تحتاج إلى استخدام FormData و MultipartFile
        "image1": image,
        "sub_category_id": subCategoryId,
        // "product_name": "Example Product",
        // "product_price": 200,
        // "detail": "This is an example product.",
        // // لإرسال صورة، قد تحتاج إلى استخدام FormData و MultipartFile
        // "image1": "YOUR_IMAGE_DATA",
        // "sub_category_id": 1,
      }
          // {
          //   "product_price": "$price",
          //   "detail": "$detail",
          //   "image1": "$image",
          //   "sub_category_id": "$subCategoryId",
          //   "product_name": "$productName",
          // },

          );
      // print("The Response Is : \n \n" '$response');
      return Right(AddPrdouctModel.fromJson(response));
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
      // print(" 5555555555" '$response');
      return Right(ProductGetAllModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, List<ProductGetAllModel>>> productGetAllDetail() async {
    try {
      final response = await api.get(
        EndPoints.productGetAllDetail,
      );
      if (response is List) {
        final ProductList = response
            .map((productData) => ProductGetAllModel.fromJson(productData))
            .toList();

        // print("Category of first product is ${ProductList[0].massege}");

        return Right(ProductList);
      } else {
        return Left('Expected a list but got ${response.runtimeType}');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, EditProductModel>> editPorduct(
      {String? producName,
      String? productPrice,
      String? detail,
      String? image,
      int? subCategoryId,
      required String id}) async {
    try {
      final response = await api
          .post(EndPoints.editPrdouct(subCategoryId.toString()), data: {
        "product_name": producName,
        "product_price": productPrice,
        "detail": detail,
        "image1": image,
        "sub_category_id": subCategoryId,
        // "bags4",

        // "/9j/4AAQSkZJRgABAQEAlgCWAAD/2wBDAAQDAwQDAwQEAwQFBAQFBgoHBgYGBg0JCggKDw0QEA8NDw4RExgUERIXEg4PFRwVFxkZGxsbEBQdHx0aHxgaGxr/2wBDAQQFBQYFBgwHBwwaEQ8RGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhr/wgARCAFZAfIDASIAAhEBAxEB/8QAHAABAAIDAQEBAAAAAAAAAAAAAAYHAwQFAgEI/8QAGwEBAAMBAQEBAAAAAAAAAAAAAAECAwQFBgf/2gAMAwEAAhADEAAAAb/AAAAAAAAAAAAAAAAAApW4KK6OTDYnDjvd49/jyfowAAAAAAAAAAAAAAAAAAAAAAAAAAAAFJ3YvT847H6E5u+EZnVG6lN79V58zmxFfbyZm43Yo+hIAAAAAAAAAAAAAAAAAAAAABgg8xP/AJQ0O2p+iojS2bas6j3Ka1w4tteuv6zJYWYYfmRjfBt59LK06tX86bF4/U6pLb49QrIAAAAAAAAAAAAAAAAA8npXtT60uys4FsdWfjzmbU+fSw86cN3DqSa3NwvU386+bD/WDBh7G88+pvitarLj/PfdyV5Yda+R08SbwSYfqnzXYnkJ7HLpZg59QAAAAAAAAAAAAAAADHS1on1J8PZ7scGc2oEh8PuDDhq8zCWSifJwYdyRZ5wXStTRz6KmhP6ajdr/AJ03JdBLeh0tnhq2kfF1mc/briV5xGjTl50pnN+DDYAAAAAAAAAAAAAAACqqX/W+lvn+YN39SrPyrofrmrLxUXrUdWWzoYstS5vHUv4f2Rb+fz/YDLpa2z8MOfn7594XdFTcm72kVHOJIgPNJ40I6HZ1TgYagAAAAAAAAAAAAAAAAAfPy/df5w6sx66cvVs6Mz6PmfEw5/X8r6IM+gADHq72ubDT3AABhya0xTt5UR+gb3DG4AAAAAAAAAAAAAAAAA46KMgvrz6OCwtGzO35f"
      });
      print(" The Response Is : \n \n" '$response');
      return Right(EditProductModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
