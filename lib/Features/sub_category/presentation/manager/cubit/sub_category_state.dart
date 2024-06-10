abstract class SubCategoryState {}

class GetAllSubCategoryInitialState extends SubCategoryState {}

class GetAllSubCategoryLoading extends SubCategoryState {}

class GetAllSubCategorySuccess extends SubCategoryState {}

class GetAllSubCategoryFailure extends SubCategoryState {
  final String errMessage;

  GetAllSubCategoryFailure({required this.errMessage});
}
