abstract class AddProductState {}

class AddProductImageInitalState extends AddProductState {}

class AddProductImageLoadingState extends AddProductState {}

class AddProductImageSuccessState extends AddProductState {}

class AddProductImageErrorState extends AddProductState {
  final String error;

  AddProductImageErrorState({required this.error});
}

class SelectImageState extends AddProductState {}

class AddProductInitalState extends AddProductState {}

class AddProductLoadingState extends AddProductState {}

class AddProductSuccessState extends AddProductState {}

class AddProductErrorState extends AddProductState {
  final String error;

  AddProductErrorState({required this.error});
}

class ClearFormState extends AddProductState {}
