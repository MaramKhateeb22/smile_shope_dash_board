// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/views/widget/detail_product_view_body.dart';

class DetailProductView extends StatelessWidget {
  DetailProductView({Key? key, required this.product}) : super(key: key);
  Data product;
  // int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailProductViewBody(
        product: product,
      ),
    );
  }
}
