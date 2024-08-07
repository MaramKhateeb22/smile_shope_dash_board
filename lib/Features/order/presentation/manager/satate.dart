abstract class OrderState {}

class GetAllOrderInitState extends OrderState {}

class GetAllOrderLoading extends OrderState {}

class GetAllOrderSuccess extends OrderState {}

class GetAllOrderFailure extends OrderState {
  final String errMessage;

  GetAllOrderFailure({required this.errMessage});
}

//get payment
class GetAllPaymentProofLoading extends OrderState {}

class GetAllPaymentProofSuccess extends OrderState {}

class CetAllPaymentProofFailure extends OrderState {
  final String errMessage;

  CetAllPaymentProofFailure({required this.errMessage});
}
