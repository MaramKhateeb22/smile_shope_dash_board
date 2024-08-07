// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smile_shope_dash_board/Features/product/data/model/number_product_model.dart';

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

//Get All Product
class AddProductLoadingState extends ProductState {}

class AddProductSuccessState extends ProductState {}

class AddProductFailerState extends ProductState {
  final String error;

  AddProductFailerState({required this.error});
}

//Edit Product
class EditProductLoadingState extends ProductState {}

class EditProductSuccessState extends ProductState {}

class EditProductFailerState extends ProductState {
  final String error;

  EditProductFailerState({required this.error});
}

//Number Product
class numberProductLoadingState extends ProductState {}

class numberProductSuccessState extends ProductState {
  NumberPorductModel numberPorductl;
  numberProductSuccessState({
    required this.numberPorductl,
  });
}

class numberProductFailerState extends ProductState {
  final String error;

  numberProductFailerState({required this.error});
}
