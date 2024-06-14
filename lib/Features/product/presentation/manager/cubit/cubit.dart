import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_add_model';
import 'package:smile_shope_dash_board/Features/product/data/model/product_delete_modle.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/Features/product/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class ProductCubit extends Cubit<ProductState> {
  // AddProductCubit(super.AddProductInitalState, this.api);

  ProductCubit(
    this.productRepo,
  ) : super(ProductImageInitalState());
  // ProductCubit get(context) => BlocProvider.of(context);
  // ApiConsumer api;
  ProductRepo productRepo;
  ProductGetAllModel? allProduct;
  ProductDeleteModel? deleteProduct;
  AddPrdouctModel? addproduct;
  String? image;
  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Uint8List? imageProduct;

  void setImage(String imageProduct) {
    image = imageProduct;
  }

  String getImage() {
    return image ?? '3 null';
  }

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
//convert to bytes
    String base64string = base64.encode(img); //convert bytes to base64 string
    // setImage(base64string);
    imageProduct = img;
    emit(SelectImageState());
  }

  void addProduct(String price, String details, String image,
      String selectedSubCategoryId, String name, context) async {
    if (formkey.currentState!.validate()) {
      emit(AddProductLoadingState());
      final response = await productRepo.productAdd(
          priceController.text,
          detailController.text,
          getImage(),
          selectedSubCategoryId,
          // selectedSubCategoryId,
          nameController.text);
      print('       maram +yousra= love      ' '${getImage()}');
      response.fold((errMessage) {
        emit(AddProductFailerState(error: errMessage));
        message(context, errMessage);
      }, (product) {
        addproduct = product;
        emit(AddProductSuccessState());
        message(context, 'تم الإضافة بنجاح');
        clearForm();
      });
    } else {
      message(context, 'يوجد حقل فارغ');
    }
  }

  void clearForm() {
    nameController.clear();
    priceController.clear();
    detailController.clear();
    imageProduct = null;
    emit(ClearFormState());
  }

  getAllProducts() async {
    emit(AllProductsLoadingState());
    final response = await productRepo.productGetAll();
    response.fold((errMessage) {
      emit(AllProductsFailerState(error: errMessage));
      // print('55555555555555555555555551111111111155');
    }, (product) {
      allProduct = product;
      allProduct!.data!.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      // print('222222222222222' "allProduct!.data![0].productName!");
      emit(AllProductsSuccessState());
    });
  }

//Delete product Function
  deleteProductFunction(String id, context) async {
    emit(DeleteLoadingState());
    final response = await productRepo.productDelete(id);
    response.fold((errMessage) {
      emit(AllProductsFailerState(error: errMessage));
      message(context, errMessage);
    }, (product) {
      deleteProduct = product;
      emit(AllProductsSuccessState());
      message(context, 'تم الحذف بنجاح');
    });
  }
}
