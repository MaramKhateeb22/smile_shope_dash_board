import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/all_product_for_sub_category_model.dart';
import '/Features/sub_category/data/model/sub_category_get_all_model.dart';
import '/Features/sub_category/data/repo/repo.dart';
import '/Features/sub_category/presentation/manager/cubit/sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit(
    this.subcategoryRepository,
  ) : super(GetAllSubCategoryInitialState());
  SubCategoryGetAllModel? allSubCategory;
  final SubCategoryRepositry subcategoryRepository;
  List<AllProductForSubCategoryModel>? allProductForSubCategory;

  getAllSubCategory() async {
    emit(GetAllSubCategoryLoading());
    final response = await subcategoryRepository.subcategoryGetAll();
    response.fold(
        (errMessage) => emit(GetAllSubCategoryFailure(errMessage: errMessage)),
        (subcategory) {
      allSubCategory = subcategory;
      emit(GetAllSubCategorySuccess(allSubCategory: subcategory));
    });
  }

  getAllproductForSubCategory(String id) async {
    emit(GetAllProductForSubCateLoadingState());
    final response = await subcategoryRepository.allProductForSubCategory(id);
    response.fold(
        (errMessage) =>
            emit(GetAllProductForSubCateFailureState(errMessage: errMessage)),
        (Subcategory) {
      allProductForSubCategory = Subcategory;
      emit(GetAllProductForSubCateSuccessState());
    });
  }
}
