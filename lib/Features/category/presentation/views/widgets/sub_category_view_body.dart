import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_Sub_Category_model.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import 'category_card_widget.dart';

class SubGategoryViewBody extends StatefulWidget {
  SubGategoryViewBody({super.key, required this.id});
  int? id;
  @override
  State<SubGategoryViewBody> createState() => _SubGategoryViewBodyState();
}

class _SubGategoryViewBodyState extends State<SubGategoryViewBody> {
  // داخل الصفحة الثانية، قد تتمكن من الحصول على id بهذه الطريقة (اعتمادًا على إعداد الrouter):
  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: buildAppBar(
        title: 'الأصناف الفرعية',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<dynamic>(
          future: context.read<CategoryCubit>().getAllSubCategoryForOneCategory(
              widget.id.toString()), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('يوجد خطأ: ${snapshot.error}'));
            } else {
              List<GetAllSubCatForOneCatModel?> allSubCategory =
                  context.read<CategoryCubit>().allSubCategoryForOneCategory!;
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
                    itemBuilder: (context, index) {
                      // categoryid = allSubCategory[index].id!;
                      return CategoryCardWidget(
                        textbutton: 'إضافة منتج',
                        id: allSubCategory[index]!.id!,
                        isButton: true,
                        isShowSubCategory: true,
                        isDisplayFlotaingButton: false,
                        nextPageInIconDetail: '/sub_category_view',
                        title: allSubCategory[index]!.title2!,
                        image: allSubCategory[index]!.image2!,
                      );
                    },
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
