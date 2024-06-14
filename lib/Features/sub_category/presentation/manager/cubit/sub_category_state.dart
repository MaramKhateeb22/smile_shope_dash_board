import 'package:smile_shope_dash_board/Features/sub_category/data/model/sub_category_get_all_model.dart';

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
