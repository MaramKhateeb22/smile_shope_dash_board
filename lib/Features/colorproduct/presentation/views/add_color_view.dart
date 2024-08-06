import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/state.dart';

class AddColorView extends StatelessWidget {
  const AddColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state is AddColorSuccessState) {
          context.replace('/all_Color_view');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('إضافة لون  '),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Form(
                  key: context.read<ColorCubit>().formkey,
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller:
                              context.read<ColorCubit>().colorController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('أدخل اسم اللون'),
                            hintText: 'اسم اللون ',
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
                            state is AddColorLoadingState
                                ? const CircularProgressIndicator()
                                : MaterialButton(
                                    onPressed: () {
                                      context
                                          .read<ColorCubit>()
                                          .formkey
                                          .currentState!
                                          .validate();
                                      // print('dddd' '$selectedSubCategory');
                                      context.read<ColorCubit>().addcolorCubit(
                                          context
                                              .read<ColorCubit>()
                                              .colorController
                                              .text,
                                          context);
                                    },
                                    color: const Color.fromARGB(
                                        255, 236, 245, 252),
                                    elevation: 5,
                                    child: const Text('حفظ '),
                                  ),
                            // const ColordBox(
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
