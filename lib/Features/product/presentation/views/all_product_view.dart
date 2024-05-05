import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/core/widgets/custom_app_bar.dart';

import 'widget/all_product_view_body.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'كل المنتجات'),
      body: AllProductViewBody(),
    );
  }
}
