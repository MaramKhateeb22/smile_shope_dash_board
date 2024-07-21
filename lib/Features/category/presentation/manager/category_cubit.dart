import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_Sub_Category_model.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_delete_model.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

import '../../data/models/category_all_get_model.dart';
import '../../data/repos/repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(
    this.categoryRepository,
  ) : super(GetAllCategoryInitialState());
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  final CategoryRepositry categoryRepository;
  CategoryGetAllModle? allCategory;
  DeleteCategoryModel? deleteCategory;
List < GetAllSubCatForOneCatModel>? allSubCategoryForOneCategory;
  getAllCategory() async {
    emit(GetAllCategoryLoading());
    final response = await categoryRepository.categoryGetAll();
    response.fold(
        (errMessage) => emit(CetAllCategoryFailure(errMessage: errMessage)),
        (category) {
      allCategory = category;
      emit(GetAllCategorySuccess());
    });
  }

  getAllSubCategoryForOneCategory(String id) async {
    emit(GetAllSubCategoryLoading());
    final response = await categoryRepository.subCategoryGetAll(id);
    response.fold(
        (errMessage) => emit(CetAllSubCategoryFailure(errMessage: errMessage)),
        (Subcategory) {
      allSubCategoryForOneCategory = Subcategory;
      emit(GetAllSubCategorySuccess());
    });
  }

  deleteCategoryFunction(String id, context) async {
    emit(DeleteCategoryLoading());
    final response = await categoryRepository.categoryDelete(id);
    response.fold(
      (errMessage) {
        emit(DeleteCategoryFailure(errMessage: errMessage));
        message(context, errMessage);
      },
      (category) {
        deleteCategory = category;
        emit(DeleteCategorySuccess());
        message(context, 'تم الحذف بنجاح');
      },
    );
  }
  adddCategoryFunction( context,String title,String image) async {
    emit(DeleteCategoryLoading());
    final response = await categoryRepository.addCategory(title,image);
    response.fold(
      (errMessage) {
        emit(DeleteCategoryFailure(errMessage: errMessage));
        message(context, errMessage);
      },
      (category) {
        emit(DeleteCategorySuccess());
        message(context, 'تم الاضافة بنجاح');
      },
    );
  }
}
