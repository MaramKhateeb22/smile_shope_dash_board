import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/Features/size/data/model/all_model_size.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/manager/cubit/state.dart';

class AllSizeView extends StatefulWidget {
  const AllSizeView({super.key});

  @override
  State<AllSizeView> createState() => _AllSizeViewState();
}

class _AllSizeViewState extends State<AllSizeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 80, top: 50, left: 80),
        child: FutureBuilder<dynamic>(
          future: context
              .read<SizeCubit>()
              .getAllSize(), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // else if (snapshot.hasError) {
            //   return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            // }
            else {
              AllSizeModel allsize = context.read<SizeCubit>().allSize!;
              // print(
              // "kkkkkkkkkkkkkkkkkkkkkkkkkkkallproduct" "${allProduct.data}");
              return BlocConsumer<SizeCubit, SizeState>(
                listener: (context, state) {
                  if (state is DeleteSizeSuccessState) {
                    setState(() {});
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: allsize.data!.length,
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
                                      '${allsize.data![index].sizeName}',
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
                                              'edit_size_view_body',
                                              pathParameters: {
                                                "size_id": allsize
                                                    .data![index].id
                                                    .toString(),
                                                "size_name": allsize
                                                    .data![index].sizeName!
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
                                                      .read<SizeCubit>()
                                                      .deleteSizeFunction(
                                                          allsize
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
                            context.go('/add_size_view');
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
                                'إضافة حجم',
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
    );
  }
}
