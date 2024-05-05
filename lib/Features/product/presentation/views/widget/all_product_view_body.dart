import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/views/widget/custom_all_product_widget.dart';

class AllProductViewBody extends StatelessWidget {
  const AllProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right:80,top: 15,left: 80 ),
        child: GridView.builder(
          itemBuilder: (context, index) =>  CustomAllProductWidget(),
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
           mainAxisSpacing: 40,
            childAspectRatio: 2/1.6,

            crossAxisSpacing: 60,
            crossAxisCount: 3,

          ),

        ),
      ),
    );
  }
}
