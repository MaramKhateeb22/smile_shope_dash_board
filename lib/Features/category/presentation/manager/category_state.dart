
abstract class CategoryState {}

class GetAllCategoryInitialState extends CategoryState {}

class GetAllCategoryLoading extends CategoryState {}

class GetAllCategorySuccess extends CategoryState {}
class CetAllCategoryFailure extends CategoryState {
  final String errMessage;

  CetAllCategoryFailure({required this.errMessage});
}
