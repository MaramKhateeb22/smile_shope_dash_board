import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/add_model_size.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/all_model_size.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/delete_model.dart';
import 'package:smile_shope_dash_board/Features/size/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class SizeCubit extends Cubit<SizeState> {
  // AddProductCubit(super.AddProductInitalState, this.api);

  SizeCubit(
    this.sizeRepo,
  ) : super(AddSizeInitalState());
  // ProductCubit get(context) => BlocProvider.of(context);
  // ApiConsumer api;
  SizeRepo sizeRepo;
  AllSizeModel? allSize;
  SizeDeleteModel? deleteSize;
  AddSizeModel? addsize;
  final formkey = GlobalKey<FormState>();
  final formkeyedit = GlobalKey<FormState>();

  TextEditingController sizeController = TextEditingController();

  void addsizeCubit(String sizeName, context) async {
    if (formkey.currentState!.validate()) {
      emit(AddSizeLoadingState());
      final response = await sizeRepo.addSize(sizeName);

      response.fold((errMessage) {
        emit(AddSizeErrorState(error: errMessage));
        message(context, errMessage);
      }, (size) {
        addsize = size;
        emit(AddSizeSuccessState());
        message(context, 'تم إضاقة الحجم  بنجاح');
        // clearForm();
      });
    } else {
      message(context, 'يوجد حقل فارغ');
    }
  }

  // void clearForm() {
  //   sizeController.clear();
  //   emit(ClearFormState());
  // }

  getAllSize() async {
    emit(AllSizeLoadingState());
    final response = await sizeRepo.sizeGetAll();
    response.fold(
      (errMessage) {
        emit(AllSizeErrorState(error: errMessage));
        // print('55555555555555555555555551111111111155');
      },
      (size) {
        allSize = size;
        allSize!.data!.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        // print('222222222222222' "allProduct!.data![0].productName!");
        emit(AllSizeSuccessState());
      },
    );
  }

//Delete sized Function
  deleteSizeFunction(String id, context) async {
    emit(DeleteSizeLoadingState());
    final response = await sizeRepo.sizeDlelte(id);
    response.fold(
      (errMessage) {
        emit(DeleteSizeErrorState(error: errMessage));
        message(context, errMessage);
      },
      (size) {
        deleteSize = size;
        emit(DeleteSizeSuccessState());
        message(context, 'تم الحذف بنجاح');
      },
    );
  }

//eidt size function

  editSizeFunction(context,  {required String sizeName,
    required String id,
  }) async {
    emit(EditSizeLoadingState());
    final response = await sizeRepo.editSize(id: id, sizeName: sizeName);
    response.fold(
      (errMessage) {
        emit(EditSizeErrorState(error: errMessage));
        message(context, errMessage);
      },
      (size) {
        emit(EditSizeSuccessState());
        message(context, 'تم التعديل بنجاح');
      },
    );
  }
}
