import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/manager/cubit/state.dart';

class AddSizeView extends StatelessWidget {
  const AddSizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SizeCubit, SizeState>(
      listener: (context, state) {
        if (state is AddSizeSuccessState) {
          context.go('/all_size_view');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('إضافة حجم  '),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Form(
                  key: context.read<SizeCubit>().formkey,
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: context.read<SizeCubit>().sizeController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('أدخل اسم الحجم'),
                            hintText: 'اسم الحجم ',
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
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            state is AddSizeLoadingState
                                ? const CircularProgressIndicator()
                                : MaterialButton(
                                    onPressed: () {
                                      context
                                          .read<SizeCubit>()
                                          .formkey
                                          .currentState!
                                          .validate();
                                      // print('dddd' '$selectedSubCategory');
                                      context.read<SizeCubit>().addsizeCubit(
                                            context
                                                .read<SizeCubit>()
                                                .sizeController
                                                .text,
                                            context
                                                .read<SizeCubit>()
                                                .sizeController
                                                .text,
                                          );
                                    },
                                    color: const Color.fromARGB(
                                        255, 236, 245, 252),
                                    elevation: 5,
                                    child: const Text('حفظ '),
                                  ),
                            // const SizedBox(
                            //   width: 20,
                            // ),
                            // MaterialButton(
                            //   onPressed: () {
                            //     context.read<ProductCubit>().clearForm();
                            //   },
                            //   color: const Color.fromARGB(255, 236, 245, 252),
                            //   elevation: 5,
                            //   child: const Text('حذف '),
                            // ),
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
