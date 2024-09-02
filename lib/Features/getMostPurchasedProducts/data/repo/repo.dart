import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/data/model/getAllNumber.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/data/model/getMostPurchasedProducts_model.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/show_payment_proof.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

import '../../../../core/errors/exception.dart';

class getMostPurchasedProductsReoposetry {
  final ApiConsumer api;
  getMostPurchasedProductsReoposetry({required this.api});

  Future<Either<String, List<getMostPurchasedProductsModel>>>
      getMostPurchasedProducts() async {
    try {
      final response = await api.get(
        EndPoints.getMostPurchasedProducts,
      );
      if (response is List) {
        final allMostPurchasedProducts = response
            .map((allMostPurchasedProducts) => getMostPurchasedProductsModel
                .fromJson(allMostPurchasedProducts))
            .toList();

        // print("Category of first product is ${allOrder[0].title2}");

        return Right(allMostPurchasedProducts);
      } else {
        return Left('Expected a list but got ${response.runtimeType}');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, getAllNumberModel>> getAllnumberRepo() async {
     try {
      final response = await api.get(
        EndPoints.getAllNumber,
      );

      return Right(getAllNumberModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, ShowAllPaymentProofModel>> paymentProofsAll() async {
   try {
      final response = await api.get(
        EndPoints.paymentProof,
      ); 

      return Right(ShowAllPaymentProofModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
