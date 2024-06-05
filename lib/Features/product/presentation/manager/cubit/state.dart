abstract class ProductState {}

class ProductImageInitalState extends ProductState {}

class ProductImageLoadingState extends ProductState {}

class ProductImageSuccessState extends ProductState {}

class ProductImageErrorState extends ProductState {
  final String error;

  ProductImageErrorState({required this.error});
}

class SelectImageState extends ProductState {}

class ProductInitalState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState({required this.error});
}

class ClearFormState extends ProductState {}

//
///get all products
class AllProductsLoadingState extends ProductState {}

class AllProductsSuccessState extends ProductState {}

class AllProductsFailerState extends ProductState {
  final String error;

  AllProductsFailerState({required this.error});
}
//delelte the products

class DeleteLoadingState extends ProductState {}

class DeleteSuccessState extends ProductState {}

class DeleteFailerState extends ProductState {
  final String error;

  DeleteFailerState({required this.error});
}
