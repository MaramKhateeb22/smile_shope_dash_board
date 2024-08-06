import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/state.dart';

class EditColorView extends StatefulWidget {
  EditColorView({super.key, required this.id, this.colorName});
  String id;
  String? colorName;

  @override
  State<EditColorView> createState() => _EditColorViewState();
}

class _EditColorViewState extends State<EditColorView> {
  @override
  void initState() {
    super.initState();
    context.read<ColorCubit>().colorController.text = widget.colorName!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state is EditColorSuccessState) {
          context.replace('/all_color_view');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('تعديل اللون  '),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Form(
                  key: context.read<ColorCubit>().formkeyedit,
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller:
                              context.read<ColorCubit>().colorController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('عدل اسم اللون'),
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
                            state is EditColorLoadingState
                                ? const CircularProgressIndicator()
                                : MaterialButton(
                                    onPressed: () {
                                      // print("Hwklllll" widget.id);
                                      // print('\n' context.read<ColorCubit>().colorController.text);

                                      context
                                          .read<ColorCubit>()
                                          .editColorFunction(context,
                                              id: widget.id,
                                              colorName: context
                                                  .read<ColorCubit>()
                                                  .colorController
                                                  .text);
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
