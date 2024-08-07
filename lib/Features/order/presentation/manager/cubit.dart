import 'package:bloc/bloc.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_model.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/show_payment_proof.dart';
import 'package:smile_shope_dash_board/Features/order/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/manager/satate.dart';

class GetAllOrderCubit extends Cubit<OrderState> {
  GetAllOrderCubit(
    this.orderRepositry,
  ) : super(GetAllOrderInitState());
  final OrderRepositry orderRepositry;

  ShowAllPaymentProofModel? allPaymentProof;
  List<GetAllOrderModel>? allorder;
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
}
