import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/models/category_all_get_model.dart';
import 'category_card_widget.dart';

class CategoryMainAllBody extends StatelessWidget {
  const CategoryMainAllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(249, 249, 249, 249),
      appBar: buildAppBar(
        title: 'الأصناف',
        isActionAdd: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<dynamic>(
          future: context
              .read<CategoryCubit>()
              .getAllCategory(), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            } else {
              CategoryGetAllModle allCategory =
                  context.read<CategoryCubit>().allCategory!;

              return GridView.builder(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1 / 1.45,
                      crossAxisSpacing: 20,

                      mainAxisSpacing: 20),
                  itemCount: allCategory.data!.length,
                  itemBuilder: (context, index) => CategoryCardWidget(
                        isButton: true,
                        isShowSubCategory: true,
                        isDisplayFlotaingButton: false,
                        nextPageInIconDetail: '/sub_category_view',
                        title: allCategory.data![index].title1!,
                      ));
            }
          },
        ),
      ),
    );
  }
}
