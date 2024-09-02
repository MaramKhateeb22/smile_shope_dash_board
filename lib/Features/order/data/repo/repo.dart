import 'package:dartz/dartz.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_model.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_model_unpaid.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_paid_model.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/show_payment_proof.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/verify_model.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

import '../../../../core/errors/exception.dart';

class OrderRepositry {
  final ApiConsumer api;
  OrderRepositry({required this.api});

  Future<Either<String, List<GetAllOrderModel>>> getAllOrderepo() async {
    try {
      final response = await api.get(
        EndPoints.getAllOrder,
      );
      if (response is List) {
        final allOrder = response
            .map((allorder) => GetAllOrderModel.fromJson(allorder))
            .toList();

        // print("Category of first product is ${allOrder[0].title2}");

        return Right(allOrder);
      } else {
        return Left('Expected a list but got ${response.runtimeType}');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, List<GetAllOrderPaidModel>>>
      getAllOrderPaidepo() async {
    try {
      final response = await api.get(
        EndPoints.getAllOrderPaid,
      );
      if (response is List) {
        final allOrder = response
            .map((allorder) => GetAllOrderPaidModel.fromJson(allorder))
            .toList();

        // print("Category of first product is ${allOrder[0].title2}");

        return Right(allOrder);
      } else {
        return Left('Expected a list but got ${response.runtimeType}');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, List<GetAllOrderUnPaidModel>>>
      getAllOrdeUnPaidrepo() async {
    try {
      final response = await api.get(
        EndPoints.getAllOrderUnPaid,
      );
      if (response is List) {
        final allOrder = response
            .map((allorder) => GetAllOrderUnPaidModel.fromJson(allorder))
            .toList();

        // print("Category of first product is ${allOrder[0].title2}");

        return Right(allOrder);
      } else {
        return Left('Expected a list but got ${response.runtimeType}');
      }
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

  Future<Either<String, verify_model>> verifyPaid(
    String id,
    int proved,
  ) async {
    try {
      final response = await api.post(EndPoints.verifyPaid(id),
          qureyparamer: {"approved": proved.toString()});
      print(" The Response Is : \n \n" '$response');
      return Right(verify_model.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
