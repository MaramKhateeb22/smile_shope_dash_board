import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1/1.45,
              crossAxisSpacing: 20,
            // mainAxisExtent: 3,
              mainAxisSpacing: 20


          ),
          itemBuilder: (context, index) => CategoryCardWidget(isButton: true,isShowSubCategory: true,isDisplayFlotaingButton: false,nextPageInIconDetail: '/sub_category_view',)
        ),
      ),
    );
  }
}
