import 'package:bloc/bloc.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_model.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_model_unpaid.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_paid_model.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/show_payment_proof.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/verify_model.dart';
import 'package:smile_shope_dash_board/Features/order/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/manager/satate.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class GetAllOrderCubit extends Cubit<OrderState> {
  GetAllOrderCubit(
    this.orderRepositry,
  ) : super(GetAllOrderInitState());
  final OrderRepositry orderRepositry;

  ShowAllPaymentProofModel? allPaymentProof;
  List<GetAllOrderModel>? allorder;
  verify_model? verify;
  List<GetAllOrderPaidModel>? allorderPaid;
  List<GetAllOrderUnPaidModel>? allorderUnpaid;
  getAllOrder() async {
    emit(GetAllOrderLoading());
    final response = await orderRepositry.getAllOrderepo();
    response
        .fold((errMessage) => emit(GetAllOrderFailure(errMessage: errMessage)),
            (category) {
      allorder = category;
      emit(GetAllOrderSuccess());
    });
  }

  getAllOrderPaid() async {
    emit(GetAllOrderPaidLoading());
    final response = await orderRepositry.getAllOrderPaidepo();
    response.fold(
        (errMessage) => emit(GetAllOrderPaidFailure(errMessage: errMessage)),
        (orderPaid) {
      allorderPaid = orderPaid;
      emit(GetAllOrderPaidSuccess());
    });
  }

  getAllOrderUnPaid() async {
    emit(GetAllOrderUnpaidLoading());
    final response = await orderRepositry.getAllOrdeUnPaidrepo();
    response.fold(
        (errMessage) => emit(GetAllOrderUnpaidFailure(errMessage: errMessage)),
        (orderUnpaid) {
      allorderUnpaid = orderUnpaid;
      emit(GetAllOrderUnpaidSuccess());
    });
  }

  getAllpaymentProor() async {
    emit(GetAllPaymentProofLoading());
    final response = await orderRepositry.paymentProofsAll();
    response.fold(
        (errMessage) => emit(CetAllPaymentProofFailure(errMessage: errMessage)),
        (PaymentProofs) {
      allPaymentProof = PaymentProofs;
      emit(GetAllPaymentProofSuccess());
    });
  }

  void verifyAcceptCubit(String id, int approved, context) async {
    // if (formkey.currentState!.validate()) {
    emit(VerifyPaidLoadingAcceptState());
    final response = await orderRepositry.verifyPaid(id, approved);

    response.fold((errMessage) {
      emit(VerifyPaidFailerAcceptState(errMessage: errMessage));
      message(context, errMessage);
    }, (paid) {
      verify = paid;
      emit(VerifyPaidSuccessAcceptState());
      // message(context, 'تم إضاقة  اللون  بنجاح');
    });
  }

  void verifyCubitReject(String id, int approved, context) async {
    // if (formkey.currentState!.validate()) {
    emit(VerifyPaidLoadingRejectState());
    final response = await orderRepositry.verifyPaid(id, approved);

    response.fold((errMessage) {
      emit(VerifyPaidFailerRejectState(errMessage: errMessage));
      message(context, errMessage);
    }, (paid) {
      verify = paid;
      emit(VerifyPaidSuccessRejectState());
      // message(context, 'تم إضاقة  اللون  بنجاح');
    });
  }
}
