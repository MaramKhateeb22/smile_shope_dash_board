abstract class OrderState {}

class GetAllOrderInitState extends OrderState {}

class GetAllOrderLoading extends OrderState {}

class GetAllOrderSuccess extends OrderState {}

class GetAllOrderFailure extends OrderState {
  final String errMessage;

  GetAllOrderFailure({required this.errMessage});
}

class GetAllOrderPaidLoading extends OrderState {}

class GetAllOrderPaidSuccess extends OrderState {}

class GetAllOrderPaidFailure extends OrderState {
  final String errMessage;

  GetAllOrderPaidFailure({required this.errMessage});
}

class GetAllOrderUnpaidLoading extends OrderState {}

class GetAllOrderUnpaidSuccess extends OrderState {}

class GetAllOrderUnpaidFailure extends OrderState {
  final String errMessage;

  GetAllOrderUnpaidFailure({required this.errMessage});
}

//get payment
class GetAllPaymentProofLoading extends OrderState {}

class GetAllPaymentProofSuccess extends OrderState {}

class CetAllPaymentProofFailure extends OrderState {
  final String errMessage;

  CetAllPaymentProofFailure({required this.errMessage});
}

//verify paid
class VerifyPaidLoadingAcceptState extends OrderState {}

class VerifyPaidSuccessAcceptState extends OrderState {}

class VerifyPaidFailerAcceptState extends OrderState {
  final String errMessage;

  VerifyPaidFailerAcceptState({required this.errMessage});
}

//reject

class VerifyPaidLoadingRejectState extends OrderState {}

class VerifyPaidSuccessRejectState extends OrderState {}

class VerifyPaidFailerRejectState extends OrderState {
  final String errMessage;

  VerifyPaidFailerRejectState({required this.errMessage});
}
