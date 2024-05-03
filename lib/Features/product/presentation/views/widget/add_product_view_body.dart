import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/core/widgets/custom_app_bar.dart';

import 'custom_add_product.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:Center(
         child: CustomAddProductWidget(),
      ) ,
    );
  }
}
