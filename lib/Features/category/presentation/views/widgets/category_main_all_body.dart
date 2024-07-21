import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/models/category_all_get_model.dart';
import 'category_card_widget.dart';

class CategoryMainAllBody extends StatefulWidget {
  const CategoryMainAllBody({super.key});

  @override
  State<CategoryMainAllBody> createState() => _CategoryMainAllBodyState();
}

class _CategoryMainAllBodyState extends State<CategoryMainAllBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 249, 249, 249),
      appBar: buildAppBar(
        title: 'الأصناف',
        // isActionAdd: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<dynamic>(
          future: context
              .read<CategoryCubit>()
              .getAllCategory(), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            } else {
              CategoryGetAllModle allCategory =
                  context.read<CategoryCubit>().allCategory!;
              // print("kkkkkkkkkkkkkkkkkkkkkkkkkkkallcategory"
              // "${allCategory.data}");
              return BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is DeleteCategorySuccess) {
                    setState(() {});
                  }
                },
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 1115
                            ? 4
                            : MediaQuery.of(context).size.width > 650
                                ? 2
                                : 1,
                        // crossAxisCount: 4,
                        childAspectRatio: 1 / 1.45,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: allCategory.data!.length,
                    itemBuilder: (context, index) => CategoryCardWidget(
                      id: allCategory.data![index].id,
                      isButton: true,
                      textbutton: 'إضافة قسم',
                      isShowSubCategory: true,
                      isDisplayFlotaingButton: false,
                      nextPageInIconDetail: '/sub_category_view',
                      // nextPageInIconDetail: '/category/getsubcategory',
                      title: allCategory.data![index].title1!,
                      image: allCategory.data![index].image!,
                    ),
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
