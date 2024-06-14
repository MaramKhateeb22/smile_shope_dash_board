import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/sub_category_get_all_model.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit(
    this.subcategoryRepository,
  ) : super(GetAllSubCategoryInitialState());
  SubCategoryGetAllModel? allSubCategory;
  final SubCategoryRepositry subcategoryRepository;

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
}
