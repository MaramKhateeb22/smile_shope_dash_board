import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/Features/product/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class ProductCubit extends Cubit<ProductState> {
  // AddProductCubit(super.AddProductInitalState, this.api);

  ProductCubit(this.allProductRepo) : super(ProductImageInitalState());
  ProductCubit get(context) => BlocProvider.of(context);
  // ApiConsumer api;
  ProductRepo allProductRepo;
  List<ProductGetAllModel>? allProduct;
  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Uint8List? imageProduct;

  // uploadImageProduct(Uint8List image)async {

  //     Uint8List img = await pickImage(ImageSource.gallery, context);

  //     image = img;
  //     emit(SelectImageState());

  // }

  pickImage(ImageSource source, context) async {
    ImagePicker imagepicker = ImagePicker();
    XFile? file = await imagepicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    } else {
      message(context, 'No Image Selected');
      print('No Image Selected');
    }
  }

  void selectImage(context) async {
    Uint8List img = await pickImage(ImageSource.gallery, context);

    imageProduct = img;
    emit(SelectImageState());
  }

  // void clearForm() {
  //   nameInsectController.clear();
  //   adressController.clear();
  //   spaceController.clear();
  //   image = null;
  //   emit(ClearFormState());
  // }

  // productSubmit() async {
  //   emit(AddProductInitalState());
  //   final response = await ProductRopositry.productSubmit(
  //     name: signUpName.text,
  //     phone: signUpPhoneNumber.text,
  //     email: signUpEmail.text,
  //     password: signUpPassword.text,
  //     confirmPassword: confirmPassword.text,
  //     profilePic: profilePic!,
  //   );
  //   response.fold(
  //     (errMessage) => emit(AddProductErrorState(errMessage: errMessage)),
  //     (signUpModel) =>
  //         emit(AddProductSuccessState(message: signUpModel.message)),
  //   );
  // }
  // productSubmit() {
  //   try {
  //     api.post(EndPoints.addProduct, data: {
  //       ApiKey.product_name: nameController.text,
  //       ApiKey.product_price: priceController.text,
  //       ApiKey.detail: detailController.text,
  //       // ApiKey.image1 = imageProduct,
  //     });
  //   } catch (e) {}
  // }

  getAllProducts() async {
    emit(AllProductsLoadingState());
    final response = await allProductRepo.productGetAll();
    response
        .fold((errMessage) => emit(AllProductsFailerState(error: errMessage)),
            (user) {
      allProduct = user;
      emit(AllProductsSuccessState());
    });
  }
}
