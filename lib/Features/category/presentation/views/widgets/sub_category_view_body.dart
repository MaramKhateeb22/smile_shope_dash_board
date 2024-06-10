import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_Sub_Category_model.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import 'category_card_widget.dart';

class SubGategoryViewBody extends StatefulWidget {
  const SubGategoryViewBody({super.key});

  @override
  State<SubGategoryViewBody> createState() => _SubGategoryViewBodyState();
}

class _SubGategoryViewBodyState extends State<SubGategoryViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'الأصناف الفرعية',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<dynamic>(
          future: context.read<CategoryCubit>().getAllSubCategoryForOneCategory(
              '1'), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            } else {
              List<GetAllSubCatForOneCatModel> allSubCategory =
                  context.read<CategoryCubit>().allSubCategoryForOneCategory!;
              // List<GetAllSubCatForOneCatModel> allSubCategory = (context
              //         .read<CategoryCubit>()
              //         .allSubCategoryForOneCategory! as List)
              //     .map((item) {
              //       // تحقق من أن البيانات هي في الشكل المتوقع
              //       if (item is Map<String, dynamic>) {
              //         return GetAllSubCatForOneCatModel.fromJson(item);
              //       } else {
              //         // تعامل مع الحالة التي لا تستوفي الشروط المتوقعة هنا
              //         print("البيانات ليست بالشكل المتوقع: $item");
              //         return null;
              //       }
              //     })
              //     .where(
              //         (item) => item != null) // تجنب إضافة قيم null إلى القائمة
              //     .cast<
              //         GetAllSubCatForOneCatModel>() // قم بتحويل أنواع العناصر إلى GetAllSubCatForOneCatModel
              //     .toList();

              // List<GetAllSubCatForOneCatModel> allSubCategory =
              //     (context.read<CategoryCubit>().allSubCategory! as List)
              //         .map((item) => GetAllSubCatForOneCatModel.fromJson(item))
              //         .toList();
              // List<GetAllSubCatForOneCatModel> allSubCategory = [];
              // allSubCategory.add(context.read<CategoryCubit>().allSubCategory!);

              // List<GetAllSubCatForOneCatModel> allSubCategory = [
              //   context.read<CategoryCubit>().allSubCategory!
              // ];
              // print("kkkkkkkkkkkkkkkkkkkkkkkkkkkallcategory"
              // "${allCategory.data}");
              return BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is GetAllSubCategorySuccess) {
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
                    itemCount: allSubCategory.length,
                    itemBuilder: (context, index) => CategoryCardWidget(
                      id: allSubCategory[index].id,
                      isButton: true,
                      isShowSubCategory: true,
                      isDisplayFlotaingButton: false,
                      // nextPageInIconDetail: '/sub_category_view',
                      title: allSubCategory[index].title2!,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: GridView.builder(
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 4,
      //           childAspectRatio: 1/1.25,
      //           crossAxisSpacing: 20,
      //           // mainAxisExtent: 3,
      //           mainAxisSpacing: 20
      //
      //
      //       ),
      //       itemBuilder: (context, index) => CategoryCardWidget(isButton: false,isShowSubCategory: false,isDisplayFlotaingButton: true,)
      //   ),
      // ),
    );
  }
}
