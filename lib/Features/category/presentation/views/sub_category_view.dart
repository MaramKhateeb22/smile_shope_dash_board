import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/sub_category_view_body.dart';

class SubGategoryView extends StatelessWidget {
  SubGategoryView({this.id, super.key});
  // SubGategoryView({super.key});
  int? id;
  @override
  Widget build(BuildContext context) {
    return  SubGategoryViewBody(id: id,);
    // Scaffold(
    //   body: 
    //   SubGategoryViewBody(
    //     id: id,
    //   ),
    // );
  }
}
