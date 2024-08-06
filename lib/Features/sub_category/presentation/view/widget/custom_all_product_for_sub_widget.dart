import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/auth_network_image.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/all_product_for_sub_category_model.dart';
import 'package:smile_shope_dash_board/core/utils/styles.dart';
import 'package:smile_shope_dash_board/core/widgets/row_with_icons_for_card_product_or_category.dart';
// import '../../../../category/presentation/views/widgets/auth_network_image.dart';

class CustomAllProductWidgetForSubCategory extends StatefulWidget {
  CustomAllProductWidgetForSubCategory(
      {required this.productforsubcategory, super.key});
  AllProductForSubCategoryModel productforsubcategory;
  // final product;

  @override
  State<CustomAllProductWidgetForSubCategory> createState() =>
      _CustomAllProductWidgetForSubCategorytState();
}

class _CustomAllProductWidgetForSubCategorytState
    extends State<CustomAllProductWidgetForSubCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is DeleteSuccessState) {
          setState(() {});
        }
      },
      builder: (context, state) {
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
                    clipBehavior: Clip.antiAlias,
                    // height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: RowWithIcons(
                            // onEdit: () {},
                            title: widget.productforsubcategory.productName,
                            //to move the page
                            onpressed: () {
                              // context.goNamed(
                              //   "/detail_product_view",
                              //   queryParams: {
                              //     'product_id': widget.product.id.toString(),
                              //   },
                              // );
                              context.goNamed(
                                "detail_product_Sub_view",
                                extra: widget.productforsubcategory,
                              );
                              print('ddddddddddddddd+++++++++\n'
                                  '${widget.productforsubcategory.category}');
                              // context.go('/detail_product_view');
                              // context
                              // .go('/detail_product_view/${widget.product.id}');
                            },
                            id: widget.productforsubcategory.productId,

                            isShowSubCategory: true,
                            nextPageInIconDetail: '/detail_product_view',
                            onTap: () {
                              print('deleteeee Products');
                              context
                                  .read<ProductCubit>()
                                  .deleteProductFunction(
                                      // '10',
                                      widget.productforsubcategory.productId
                                          .toString(),
                                      context);
                              // buildShwoDialogDelete(context, widget.id);
                            },
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
                              // 'id',
                              '${widget.productforsubcategory.productId} ',
                              style: Styles.style18,
                            ),
                            const Spacer(
                              flex: 6,
                            ),
                            Text(
                              '${widget.productforsubcategory.productPrice}'
                              '  s.p ',
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
              Positioned(
                right: 0,
                left: 0,
                top: -130,
                // NetworkImage('${product.image1}'),
                // child: Text('${product.image1}'),
                // child: Image.network('${product.image}'),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 200,
                  width: 200,
                  child: ImageWithAuth(
                    imageUrl: widget.productforsubcategory.image1!,
                    username: '11184828',
                    password: '60-dayfreetrial',
                  ),
                ),
                // Image(
                //   // image:NetworkImage('${widget.product.image1}'),
                //   // AssetImage('assets/images/photo1.png'),
                //   image: AssetImage(),
                //   height: 260,
                // )
              ),
            ],
          ),
        );
      },
    );
  }
}
