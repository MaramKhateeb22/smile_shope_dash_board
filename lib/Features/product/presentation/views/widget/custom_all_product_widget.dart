import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/core/utils/styles.dart';
import 'package:smile_shope_dash_board/core/widgets/row_with_icons_for_card_product_or_category.dart';

class CustomAllProductWidget extends StatelessWidget {
  CustomAllProductWidget({required this.product, super.key});
  Data product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () {
              // context.read<ProductCubit>().getAllProducts();
              // print('Hellew');
            },
            child: Card(
              elevation: 5,
              child: Container(
                // height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: RowWithIcons(
                        id: product.id,
                        isShowSubCategory: true,
                        nextPageInIconDetail: '/detail_product_view',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          '${product.id} ',
                          style: Styles.style18,
                        ),
                        const Spacer(
                          flex: 6,
                        ),
                        Text(
                          r'$ ' '${product.productPrice}',
                          style: Styles.style18,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            right: 0,
            left: 0,
            top: -190,
            // child: Text('${product.image1}'),
            child: Image(
              image: AssetImage('assets/images/photo1.png'),
              // image: NetworkImage('${product.image1}'),
              height: 260,
            ),
          ),
        ],
      ),
    );
  }
}
