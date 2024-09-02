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
class AllNumberLoadinGState
    extends GetMostPurchasedProductsState {}

class AllNumberSuccessState
    extends GetMostPurchasedProductsState {}

class AllNumberFailureState
    extends GetMostPurchasedProductsState {
  final String errMessaGe;

  AllNumberFailureState({required this.errMessaGe});
}
