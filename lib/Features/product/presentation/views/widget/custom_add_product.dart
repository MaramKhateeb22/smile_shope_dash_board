import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';

class CustomAddProductWidget extends StatelessWidget {
  const CustomAddProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
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
                  // key: ,
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
                                :
                                // width: 200,
                                // height: 200,
                                Container(
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

                        // FutureBuilder<dynamic>(
                        //   future: ,
                        //   builder: (BuildContext context,
                        //      snapshot) {
                        //     if (snapshot.connectionState ==
                        //         ConnectionState.waiting) {
                        //       return const Center(
                        //           child: CircularProgressIndicator());
                        //     }
                        //     if (snapshot.hasError) {
                        //       return Center(
                        //           child: Text('Error: ${snapshot.error}'));
                        //     }
                        //     if (snapshot.hasData) {
                        //       // تحويل البيانات إلى قائمة من DropdownMenuItem
                        //       List<DropdownMenuItem<String>> insectItems =
                        //           snapshot.data!.docs
                        //               .map((DocumentSnapshot document) {
                        //         Map<String, dynamic> insectData =
                        //             document.data()! as Map<String, dynamic>;
                        //         String insectName = insectData[
                        //             'name']; // افترض أن العمود يُدعى 'name'
                        //         return DropdownMenuItem<String>(
                        //           value: insectName,
                        //           child: Text(insectName),
                        //         );
                        //       }).toList();

                        //       return DropdownButton<String>(
                        //         icon:
                        //             const Icon(Icons.arrow_drop_down_outlined),
                        //         // dropdownColor: backgroundColor,
                        //         value: _selectedValue,
                        //         hint: const Text(
                        //             " اختر نوع الحشرة المنتشرة عندك "),
                        //         items: insectItems,
                        //         onChanged: (newValue) {
                        //           setState(() {
                        //             _selectedValue = newValue;
                        //           });
                        //         },
                        //       );
                        //     } else {
                        //       // يمكنك عرض رسالة أو ويدجت آخر هنا إذا لم تكن هناك بيانات
                        //       return const Text("لا يوجد بيانات.");
                        //     }
                        //   },
                        // ),
                        //

                        TextFormField(
                          // controller: phoneController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('أدخل اسم المنتج'),
                            hintText: 'اسم المنتج ',
                            prefixIcon: Icon(Icons.shopping_basket),
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // controller: phoneController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('أدخل اسم تفاصيل  المنتج'),
                            hintText: 'تفاصيل  المنتج ',
                            prefixIcon: Icon(Icons.details),
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // controller: phoneController,
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            context.read<ProductCubit>().addProduct(context);
                          },
                          color: const Color.fromARGB(255, 236, 245, 252),
                          elevation: 5,
                          child: const Text('حفظ '),
                        )
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
