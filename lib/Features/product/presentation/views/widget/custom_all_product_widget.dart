import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/core/utils/styles.dart';
import 'package:smile_shope_dash_board/core/widgets/row_with_icons_for_card_product_or_category.dart';

class CustomAllProductWidget extends StatelessWidget {
  const CustomAllProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () {
              context.read<ProductCubit>().getAllProducts();
              print('Hellew');
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
                        isShowSubCategory: true,
                        nextPageInIconDetail: '/detail_product_view',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          'أحذية رجالي',
                          style: Styles.style18,
                        ),
                        Spacer(
                          flex: 6,
                        ),
                        Text(
                          r'$ 20',
                          style: Styles.style18,
                        ),
                        Spacer(
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
            top: -160,
            child: Image(
              image: AssetImage('assets/images/photo1.png'),
              height: 260,
            ),
          ),
        ],
      ),
    );
  }
}
