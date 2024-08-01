import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_Sub_Category_model.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_model.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_delete_model.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

import '../../../../core/errors/exception.dart';
import '../models/add_category_model.dart';

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

  // Future<Either<String, GetAllSubCatForOneCatModel>> subCategoryGetAll(String id) async {
  //   try {
  //     final response = await api.get(
  //       EndPoints.categoryGetAllSubCategory(id),
  //     );
  //
  //     // return Right(GetAllSubCatForOneCatModel.fromJson(response));
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage);
  //   }
  // }
  Future<Either<String, List<GetAllSubCatForOneCatModel>>> subCategoryGetAll(
      String id) async {
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
  //
  //       print("Category of first product is ${categoryList[0].massege}");
  //
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

  Future<Either<String, AddCategoryModel>> addCategory(
      String title, String image) async {
    try {
      final response = await api.post(EndPoints.addCategory, data: {
        "title1": title,
        // "bags4",
        "image": image
        // "/9j/4AAQSkZJRgABAQEAlgCWAAD/2wBDAAQDAwQDAwQEAwQFBAQFBgoHBgYGBg0JCggKDw0QEA8NDw4RExgUERIXEg4PFRwVFxkZGxsbEBQdHx0aHxgaGxr/2wBDAQQFBQYFBgwHBwwaEQ8RGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhr/wgARCAFZAfIDASIAAhEBAxEB/8QAHAABAAIDAQEBAAAAAAAAAAAAAAYHAwQFAgEI/8QAGwEBAAMBAQEBAAAAAAAAAAAAAAECAwQFBgf/2gAMAwEAAhADEAAAAb/AAAAAAAAAAAAAAAAAApW4KK6OTDYnDjvd49/jyfowAAAAAAAAAAAAAAAAAAAAAAAAAAAAFJ3YvT847H6E5u+EZnVG6lN79V58zmxFfbyZm43Yo+hIAAAAAAAAAAAAAAAAAAAAABgg8xP/AJQ0O2p+iojS2bas6j3Ka1w4tteuv6zJYWYYfmRjfBt59LK06tX86bF4/U6pLb49QrIAAAAAAAAAAAAAAAAA8npXtT60uys4FsdWfjzmbU+fSw86cN3DqSa3NwvU386+bD/WDBh7G88+pvitarLj/PfdyV5Yda+R08SbwSYfqnzXYnkJ7HLpZg59QAAAAAAAAAAAAAAADHS1on1J8PZ7scGc2oEh8PuDDhq8zCWSifJwYdyRZ5wXStTRz6KmhP6ajdr/AJ03JdBLeh0tnhq2kfF1mc/briV5xGjTl50pnN+DDYAAAAAAAAAAAAAAACqqX/W+lvn+YN39SrPyrofrmrLxUXrUdWWzoYstS5vHUv4f2Rb+fz/YDLpa2z8MOfn7594XdFTcm72kVHOJIgPNJ40I6HZ1TgYagAAAAAAAAAAAAAAAAAfPy/df5w6sx66cvVs6Mz6PmfEw5/X8r6IM+gADHq72ubDT3AABhya0xTt5UR+gb3DG4AAAAAAAAAAAAAAAAA46KMgvrz6OCwtGzO35f"
      });
      print(" The Response Is : \n \n" '$response');
      return Right(AddCategoryModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  //edit category title
  Future<Either<String, AddCategoryModel>> editCategoryTitle(
      {String? title, String? image, required String id}) async {
    try {
      final response = await api.post(EndPoints.editCategoryTitle(id), data: {
        "title1": title,
        // "bags4",
        "image": image
        // "/9j/4AAQSkZJRgABAQEAlgCWAAD/2wBDAAQDAwQDAwQEAwQFBAQFBgoHBgYGBg0JCggKDw0QEA8NDw4RExgUERIXEg4PFRwVFxkZGxsbEBQdHx0aHxgaGxr/2wBDAQQFBQYFBgwHBwwaEQ8RGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhr/wgARCAFZAfIDASIAAhEBAxEB/8QAHAABAAIDAQEBAAAAAAAAAAAAAAYHAwQFAgEI/8QAGwEBAAMBAQEBAAAAAAAAAAAAAAECAwQFBgf/2gAMAwEAAhADEAAAAb/AAAAAAAAAAAAAAAAAApW4KK6OTDYnDjvd49/jyfowAAAAAAAAAAAAAAAAAAAAAAAAAAAAFJ3YvT847H6E5u+EZnVG6lN79V58zmxFfbyZm43Yo+hIAAAAAAAAAAAAAAAAAAAAABgg8xP/AJQ0O2p+iojS2bas6j3Ka1w4tteuv6zJYWYYfmRjfBt59LK06tX86bF4/U6pLb49QrIAAAAAAAAAAAAAAAAA8npXtT60uys4FsdWfjzmbU+fSw86cN3DqSa3NwvU386+bD/WDBh7G88+pvitarLj/PfdyV5Yda+R08SbwSYfqnzXYnkJ7HLpZg59QAAAAAAAAAAAAAAADHS1on1J8PZ7scGc2oEh8PuDDhq8zCWSifJwYdyRZ5wXStTRz6KmhP6ajdr/AJ03JdBLeh0tnhq2kfF1mc/briV5xGjTl50pnN+DDYAAAAAAAAAAAAAAACqqX/W+lvn+YN39SrPyrofrmrLxUXrUdWWzoYstS5vHUv4f2Rb+fz/YDLpa2z8MOfn7594XdFTcm72kVHOJIgPNJ40I6HZ1TgYagAAAAAAAAAAAAAAAAAfPy/df5w6sx66cvVs6Mz6PmfEw5/X8r6IM+gADHq72ubDT3AABhya0xTt5UR+gb3DG4AAAAAAAAAAAAAAAAA46KMgvrz6OCwtGzO35f"
      });
      print(" The Response Is : \n \n" '$response');
      return Right(AddCategoryModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
