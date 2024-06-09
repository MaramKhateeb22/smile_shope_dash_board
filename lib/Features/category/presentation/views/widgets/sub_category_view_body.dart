import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import 'category_card_widget.dart';

class SubGategoryViewBody extends StatelessWidget {
  const SubGategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'الأصناف الفرعية',

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
