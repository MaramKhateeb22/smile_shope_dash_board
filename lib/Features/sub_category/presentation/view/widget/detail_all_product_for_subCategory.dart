import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/all_product_for_sub_category_model.dart';

class DetailProductForsubcategoryViewBody extends StatelessWidget {
  AllProductForSubCategoryModel product;

  DetailProductForsubcategoryViewBody({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    // final productId =
    // int.tryParse(RouteData.of(context).pathParameters['product_id'] ?? '');
    // if (productId != null) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text('${getAllModelproduct?.data?[productId].productName} '),
                Image.network(
                  cacheHeight: 400,
                  // 'assets/images/png-transparent-handbag-tote-bag.png',
                  '${product.image1}',
                  color: Colors.transparent,
                  colorBlendMode: BlendMode.srcIn,
                ),

                RichText(
                  text: TextSpan(
                    text: 'سعر القطعة:  ',
                    // style: DefaultTextStyle.of(context).style,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: r'S.Y' '${product.productPrice} ',
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'التفاصيل:  ',
                    // style: DefaultTextStyle.of(context).style,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${product.detail} ',
                        style: const TextStyle(
                            // fontStyle: FontStyle.italic,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'الصنف الرئيسي:  ',
                    // style: DefaultTextStyle.of(context).style,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${product.category} ',
                        // text: '${product.category} ',
                        style: const TextStyle(
                            // fontStyle: FontStyle.italic,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: ' الصنف الفرعي:  ',
                    // style: DefaultTextStyle.of(context).style,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${product.subcategory} ',
                        style: const TextStyle(
                            // fontStyle: FontStyle.italic,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // عرض الألوان

                // if (product.colors != null && product.colors!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: product.colors!
                      .map((color) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'اللون: ${color.colorName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // عرض الأحجام الخاصة بكل لون
                              if (color.sizes != null &&
                                  color.sizes!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: color.sizes!
                                      .map((size) => Text(
                                            'المقاس: ${size.sizeName}, الكمية: ${size.quantity}, السعر: ${size.price}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 15),
                                          ))
                                      .toList(),
                                ),
                            ],
                          ))
                      .toList(),
                ),
//////////////////
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text(
                //       'الالوان المتوفرة:',
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //     SizedBox(
                //       height: 20,
                //       child: ListView.builder(
                //         shrinkWrap: true,
                //         itemCount: product.colors!.length,
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //           return Row(
                //             children: [
                //               Text(
                //                 '${product.colors![index].colorName}   ',
                //                 style: const TextStyle(
                //                     // fontStyle: FontStyle.italic,
                //                     color: Colors.green,
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           );
                //         },
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
