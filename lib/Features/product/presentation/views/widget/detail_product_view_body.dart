import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';

class DetailProductViewBody extends StatelessWidget {
  Data product;

  DetailProductViewBody({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    // final productId =
    // int.tryParse(RouteData.of(context).pathParameters['product_id'] ?? '');
    // if (productId != null) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text('${getAllModelproduct?.data?[productId].productName} '),
              Image.asset(
                'assets/images/png-transparent-handbag-tote-bag.png',
                color: Colors.transparent,
                colorBlendMode: BlendMode.srcIn,
              ),
              Text(
                'سعر القطعة : 22\$' r'$' '${product.productPrice}',
              ),
              const Text('التفاصيل: بلا بلا بلا '),
            ],
          ),
        ),
      ),
    );
    // تم تحويل القيمة بنجاح
    // قم بمعالجة القيمة المحولة إلى int هنا
    // } else {
    //   // لم يتم تحويل القيمة
    //   // يمكنك التعامل مع هذه الحالة هنا
    // }

    // final productId =
    //     int.tryParse(RouteData.of(context).pathParameters['product_id'] ?? '');

    // return const Column(
    //   children: [],
    // );
  }
}
