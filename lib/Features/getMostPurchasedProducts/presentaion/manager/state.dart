abstract class GetMostPurchasedProductsState {}

class GetMostPurchasedProductsInitState extends GetMostPurchasedProductsState {}

class GetMostPurchasedProductsLoadinGState
    extends GetMostPurchasedProductsState {}

class GetMostPurchasedProductsSuccessState
    extends GetMostPurchasedProductsState {}

class GetMostPurchasedProductsFailureState
    extends GetMostPurchasedProductsState {
  final String errMessaGe;

  GetMostPurchasedProductsFailureState({required this.errMessaGe});
}
