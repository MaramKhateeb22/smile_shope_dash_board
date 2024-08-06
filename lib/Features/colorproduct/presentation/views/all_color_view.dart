import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/data/model/all_model_color.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';

class AllColorView extends StatefulWidget {
  const AllColorView({super.key});

  @override
  State<AllColorView> createState() => _AllColorViewState();
}

class _AllColorViewState extends State<AllColorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 80, top: 50, left: 80),
          child: FutureBuilder<dynamic>(
            future: context
                .read<ColorCubit>()
                .getAllcolor(), // الوظيفة التي تحصل على البيانات من API
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              // else if (snapshot.hasError) {
              //   return Center(child: Text('حدث خطأ: ${snapshot.error}'));
              // }
              else {
                AllColorModel allColor = context.read<ColorCubit>().allcolor!;
                // print(
                // "kkkkkkkkkkkkkkkkkkkkkkkkkkkallproduct" "${allProduct.data}");
                return BlocConsumer<ColorCubit, ColorState>(
                  listener: (context, state) {
                    if (state is DeleteColorSuccessState) {
                      setState(() {});
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: allColor.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[200],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 50, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${allColor.data![index].colorName}',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              context.goNamed(
                                                'edit_color_view_body',
                                                pathParameters: {
                                                  "color_id": allColor
                                                      .data![index].id
                                                      .toString(),
                                                  "color_name": allColor
                                                      .data![index].colorName!
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.orange,
                                            ),
                                          ),
                                          state is DeleteLoadingState
                                              ? const CircularProgressIndicator()
                                              : IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<ColorCubit>()
                                                        .deletecolorFunction(
                                                            allColor
                                                                .data![index].id
                                                                .toString(),
                                                            context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 120,
                          child: MaterialButton(
                            elevation: 5,
                            minWidth: 50,
                            color: Colors.green[100],
                            onPressed: () {
                              context.go('/add_color_view');
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  // color: Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'إضافة لون',
                                  style: TextStyle(
                                    // color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
