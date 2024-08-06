import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/add_model_color.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/all_model_color.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/delete_model_color.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class ColorCubit extends Cubit<ColorState> {
  // AddProductCubit(super.AddProductInitalState, this.api);

  ColorCubit(
    this.colorRepo,
  ) : super(AddColorInitalState());
  // ProductCubit get(context) => BlocProvider.of(context);
  // ApiConsumer api;
  ColorRepo colorRepo;
  AllColorModel? allcolor;
  ColorDeleteModel? deletecolor;
  AddColorModel? addcolor;
  final formkey = GlobalKey<FormState>();
  final formkeyedit = GlobalKey<FormState>();

  TextEditingController colorController = TextEditingController();

  void addcolorCubit(String colorName, context) async {
    if (formkey.currentState!.validate()) {
      emit(AddColorLoadingState());
      final response = await colorRepo.addColor(colorName);

      response.fold((errMessage) {
        emit(AddColorErrorState(error: errMessage));
        message(context, errMessage);
      }, (color) {
        addcolor = color;
        emit(AddColorSuccessState());
        message(context, 'تم إضاقة  اللون  بنجاح');
        clearForm();
      });
    } else {
      message(context, 'يوجد حقل فارغ');
    }
  }

  void clearForm() {
    colorController.clear();
    emit(ClearFormState());
  }

  getAllcolor() async {
    emit(AllColorLoadingState());
    final response = await colorRepo.colorGetAll();
    response.fold(
      (errMessage) {
        emit(AllColorErrorState(error: errMessage));
        // print('55555555555555555555555551111111111155');
      },
      (colorr) {
        allcolor = colorr;
        allcolor!.data!.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        // print('222222222222222' "allProduct!.data![0].productName!");
        emit(AllColorSuccessState());
      },
    );
  }

//Delete colord Function
  deletecolorFunction(String id, context) async {
    emit(DeleteColorLoadingState());
    final response = await colorRepo.colorDlelte(id);
    response.fold(
      (errMessage) {
        emit(DeleteColorErrorState(error: errMessage));
        message(context, errMessage);
      },
      (color) {
        deletecolor = color;
        emit(DeleteColorSuccessState());
        message(context, 'تم الحذف بنجاح');
      },
    );
  }

//eidt color function

  editColorFunction(
    context, {
    required String colorName,
    required String id,
  }) async {
    emit(EditColorLoadingState());
    final response = await colorRepo.editColor(id: id, colorName: colorName);
    response.fold(
      (errMessage) {
        emit(EditColorErrorState(error: errMessage));
        message(context, errMessage);
      },
      (color) {
        emit(EditColorSuccessState());
        message(context, 'تم التعديل بنجاح');
      },
    );
  }
}
