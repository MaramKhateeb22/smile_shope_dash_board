import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/views/widget/custom_all_product_widget.dart';

class AllProductViewBody extends StatelessWidget {
  const AllProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 80, top: 15, left: 80),
        child: FutureBuilder<dynamic>(
          future: context
              .read<ProductCubit>()
              .getAllProducts(), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // else if (snapshot.hasError) {
            //   return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            // }
            else {
              ProductGetAllModel allProduct =
                  context.read<ProductCubit>().allProduct!;
              print(
                  "kkkkkkkkkkkkkkkkkkkkkkkkkkkallproduct" "${allProduct.data}");

              return GridView.builder(
                itemCount: allProduct.data!.length,
                itemBuilder: (context, index) {
                  return CustomAllProductWidget(
                    product: allProduct.data![index],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 40,
                  childAspectRatio: 2 / 1.6,
                  crossAxisSpacing: 60,
                  crossAxisCount: 3,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
