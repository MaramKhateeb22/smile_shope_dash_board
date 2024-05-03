import 'package:flutter/material.dart';

import 'widget/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddProductViewBody(),
    );
  }
}
