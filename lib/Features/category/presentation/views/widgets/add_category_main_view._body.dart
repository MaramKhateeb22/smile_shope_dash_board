import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';

class addCategoryMainViewBody extends StatelessWidget {
  const addCategoryMainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is AddCategorySuccess) {
          // context.go('/all_product_view');
          context.replace('/category_main_all_body');
        }
      },
      builder: (context, state) {
        // SubCategoryGetAllModel allSubCategory =
        // context.read<SubCategoryCubit>().allSubCategory!;
        return Scaffold(
          appBar: AppBar(
            title: const Text('إضافة صنف '),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Form(
                  key: context.read<CategoryCubit>().formkey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)),
                    width: 400,
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          color: Colors.red.shade200,
                          radius: const Radius.circular(15),
                          child: Container(
                            // clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade200,
                            ),
                            width: 300,
                            height: 130,
                            child: true
                                // child: context.read<CategoryCubit>().imageProduct ==
                                // null
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // bottom: 5,
                                          // right: 5,
                                          child: InkWell(
                                            onTap: () {
                                              // context
                                              //     .read<CategoryCubit>()
                                              //     .selectImage(context);
                                            },
                                            child: const Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons
                                                      .add_photo_alternate_outlined),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text('أضف صورة المنتج'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    // clipBehavior: Clip.antiAlias,
                                    // child: Image.memory(
                                    // context
                                    //     .read<CategoryCubit>()
                                    //     .imageProduct!,
                                    // fit: BoxFit.cover,
                                    // ),
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller:
                              context.read<CategoryCubit>().nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('أدخل اسم الصنف'),
                            hintText: 'اسم الصنف ',
                            prefixIcon: Icon(Icons.shopping_basket),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            state is AddCategoryLoading
                                ? const CircularProgressIndicator()
                                : MaterialButton(
                                    onPressed: () {
                                      // context
                                      //     .read<CategoryCubit>()
                                      //     .formkey
                                      //     .currentState!
                                      //     .validate();
                                      // if (context
                                      //         .read<CategoryCubit>()
                                      //         .imageProduct ==
                                      //     null) {
                                      //   message(
                                      //       context, 'أدخل صورة المنتج أولا');
                                      // } else {
                                      //   context
                                      //       .read<CategoryCubit>()
                                      //       .addProduct(
                                      //         context,
                                      //       );
                                      // }
                                    },
                                    color: const Color.fromARGB(
                                        255, 236, 245, 252),
                                    elevation: 5,
                                    child: const Text('حفظ '),
                                  ),
                            const SizedBox(
                              width: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                // context.read<CategoryCubit>().clearForm();
                              },
                              color: const Color.fromARGB(255, 236, 245, 252),
                              elevation: 5,
                              child: const Text('حذف '),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
