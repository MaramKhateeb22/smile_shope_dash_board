import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_state.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class CustomAddProductWidget extends StatefulWidget {
  const CustomAddProductWidget({super.key});

  @override
  State<CustomAddProductWidget> createState() => _CustomAddProductWidgetState();
}

class _CustomAddProductWidgetState extends State<CustomAddProductWidget> {
  String? selectedSubCategory;
  Map<String, int> subcategoryTitlesAndIds = {};

  @override
  void initState() {
    super.initState();
    // Call the getAllSubCategory() function to fetch the data
    context.read<SubCategoryCubit>().getAllSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is AddProductSuccessState) {
          // context.go('/all_product_view');
          context.replace('/all_product_view');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('إضافة منتج '),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Form(
                  key: context.read<ProductCubit>().formkey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)),
                    width: 400,
                    // height: double.infinity,
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
                            child: context.read<ProductCubit>().imageProduct ==
                                    null
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
                                              context
                                                  .read<ProductCubit>()
                                                  .selectImage(context);
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
                                    child: Image.memory(
                                      context
                                          .read<ProductCubit>()
                                          .imageProduct!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<SubCategoryCubit, SubCategoryState>(
                          builder: (context, state) {
                            if (state is GetAllSubCategorySuccess) {
                              subcategoryTitlesAndIds = {
                                for (var data
                                    in state.allSubCategory.data ?? [])
                                  data.title2: data.id
                              };
                              // final subcategoryTitles = state
                              //         .allSubCategory.data
                              //         ?.map((data) => data.title2)
                              //         .toList() ??
                              //     [];

                              return DropdownButton<String>(
                                value: selectedSubCategory,
                                hint: const Text('Select a sub-category'),
                                items: subcategoryTitlesAndIds.entries
                                    .map((entry) {
                                  return DropdownMenuItem<String>(
                                    value: entry
                                        .key, // العنوان هو القيمة التي توضع في القائمة
                                    child: Text(entry.key),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedSubCategory = value;
                                  });
                                  print('selectedSubCategory:'
                                      '$selectedSubCategory');
                                  // لطباعة القيمة المختارة
                                  print(
                                      'selectedSubCategoryID: ${subcategoryTitlesAndIds[selectedSubCategory]}');
                                },
                              );
                            } else if (state is GetAllSubCategoryFailure) {
                              return Text('Error: ${state.errMessage}');
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        TextFormField(
                          controller:
                              context.read<ProductCubit>().nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('أدخل اسم المنتج'),
                            hintText: 'اسم المنتج ',
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
                        TextFormField(
                          controller:
                              context.read<ProductCubit>().detailController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('أدخل  تفاصيل  المنتج'),
                            hintText: 'تفاصيل  المنتج ',
                            prefixIcon: Icon(Icons.details),
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller:
                              context.read<ProductCubit>().priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text('سعر  المنتج'),
                            hintText: 'أدخل السعر  المنتج ',
                            prefixIcon: Icon(Icons.monetization_on_outlined),
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            state is AddProductLoadingState
                                ? const CircularProgressIndicator()
                                : MaterialButton(
                                    onPressed: () {
                                      context
                                          .read<ProductCubit>()
                                          .formkey
                                          .currentState!
                                          .validate();
                                      if (context
                                              .read<ProductCubit>()
                                              .imageProduct ==
                                          null) {
                                        message(
                                            context, 'أدخل صورة المنتج أولا');
                                      } else {
                                        print('dddd' '$selectedSubCategory');
                                        context.read<ProductCubit>().addProduct(
                                            context
                                                .read<ProductCubit>()
                                                .priceController
                                                .text,
                                            context
                                                .read<ProductCubit>()
                                                .detailController
                                                .text,
                                            context
                                                .read<ProductCubit>()
                                                .getImage()
                                                .toString(),
                                            ' ${subcategoryTitlesAndIds[selectedSubCategory]}',
                                            context
                                                .read<ProductCubit>()
                                                .nameController
                                                .text,
                                            context);
                                      }
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
                                context.read<ProductCubit>().clearForm();
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
