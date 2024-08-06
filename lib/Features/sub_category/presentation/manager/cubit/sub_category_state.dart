import '/Features/sub_category/data/model/sub_category_get_all_model.dart';

abstract class SubCategoryState {}

class GetAllSubCategoryInitialState extends SubCategoryState {}

class GetAllSubCategoryLoading extends SubCategoryState {}

class GetAllSubCategorySuccess extends SubCategoryState {
  final SubCategoryGetAllModel allSubCategory;

  GetAllSubCategorySuccess({required this.allSubCategory});
}

class GetAllSubCategoryFailure extends SubCategoryState {
  final String errMessage;

  GetAllSubCategoryFailure({required this.errMessage});
}

//all Product For SubCategory

class GetAllProductForSubCateLoadingState extends SubCategoryState {}

class GetAllProductForSubCateSuccessState extends SubCategoryState {
  // final SubCategoryGetAllModel allSubCategory;

  // GetAllSubCategorySuccess({required this.allSubCategory});
}

class GetAllProductForSubCateFailureState extends SubCategoryState {
  final String errMessage;

  GetAllProductForSubCateFailureState({required this.errMessage});
}
