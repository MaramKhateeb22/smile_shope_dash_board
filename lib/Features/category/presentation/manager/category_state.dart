abstract class CategoryState {}

class GetAllCategoryInitialState extends CategoryState {}

class GetAllCategoryLoading extends CategoryState {}

class GetAllCategorySuccess extends CategoryState {}

class CetAllCategoryFailure extends CategoryState {
  final String errMessage;

  CetAllCategoryFailure({required this.errMessage});
}

class GetAllSubCategoryLoading extends CategoryState {}

class GetAllSubCategorySuccess extends CategoryState {}

class CetAllSubCategoryFailure extends CategoryState {
  final String errMessage;

  CetAllSubCategoryFailure({required this.errMessage});
}
// class DeleteCategoryInitialState extends CategoryState {}

class DeleteCategoryLoading extends CategoryState {}

class DeleteCategorySuccess extends CategoryState {}

class DeleteCategoryFailure extends CategoryState {
  final String errMessage;

  DeleteCategoryFailure({required this.errMessage});
}
//add Category

class AddCategoryLoading extends CategoryState {}

class AddCategorySuccess extends CategoryState {}

class AddCategoryFailure extends CategoryState {
  final String errMessage;

  AddCategoryFailure({required this.errMessage});
}
