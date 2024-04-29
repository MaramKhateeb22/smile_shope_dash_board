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
      appBar: buildAppBar(title: 'الأصناف'),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,childAspectRatio: 2/1,
          crossAxisSpacing: 2,
          // mainAxisExtent: 3,
          mainAxisSpacing: 5


        ),
        itemBuilder: (context, index) => CategoryCardWidget()
      ),
    );
  }
}
