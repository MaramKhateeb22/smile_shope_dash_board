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

class DeleteSubCategoryLoading extends CategoryState {}

class DeleteSubCategorySuccess extends CategoryState {}

class DeleteSubCategoryFailure extends CategoryState {
  final String errMessage;

  DeleteSubCategoryFailure({required this.errMessage});
}
//add Category

class AddCategoryLoading extends CategoryState {}

class AddCategorySuccess extends CategoryState {}

class AddCategoryFailure extends CategoryState {
  final String errMessage;

  AddCategoryFailure({required this.errMessage});
}
//edit Category

class EditCategoryLoading extends CategoryState {}

class EditCategorySuccess extends CategoryState {}

class EditCategoryFailure extends CategoryState {
  final String errMessage;

  EditCategoryFailure({required this.errMessage});
}

//add subcategory

class AddSubCategoryLoading extends CategoryState {}

class AddSubCategorySuccess extends CategoryState {}

class AddSubCategoryFailure extends CategoryState {
  final String errMessage;

  AddSubCategoryFailure({required this.errMessage});
}
