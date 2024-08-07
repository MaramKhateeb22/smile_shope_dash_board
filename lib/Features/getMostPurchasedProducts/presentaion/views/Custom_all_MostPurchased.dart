// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/auth_network_image.dart';
// import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/data/model/getMostPurchasedProducts_model.dart';
// import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/manager/cubit.dart';
// import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/manager/state.dart';
// import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/views/all_MostPurchasedProducts.dart';
// import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
// import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
// import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';
// import 'package:smile_shope_dash_board/core/utils/styles.dart';
// import 'package:smile_shope_dash_board/core/widgets/row_with_icons_for_card_product_or_category.dart';

// class CustomAllProductWidget extends StatefulWidget {
//   CustomAllProductWidget({required this.getMostPurchasedProducts, super.key});
//   getMostPurchasedProductsModel getMostPurchasedProducts;
//   // final product;

//   @override
//   State<CustomAllProductWidget> createState() => _CustomAllProductWidgetState();
// }

// class _CustomAllProductWidgetState extends State<CustomAllProductWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GetMostPurchasedProductsCubit,
//         GetMostPurchasedProductsState>(
//       listener: (context, state) {
//         // if (state is DeleteSuccessState) {
//         //   setState(() {});
//         // }
//       },
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.only(top: 100),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               InkWell(
//                 onTap: () {
//                   // context.read<ProductCubit>().getAllProducts();
//                   // print('Hellew');
//                 },
//                 child: Card(
//                   elevation: 5,
//                   child: Container(
//                     clipBehavior: Clip.antiAlias,
//                     // height: 300,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 40),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.edit,
//                               size: 23,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             const Spacer(
//                               flex: 2,
//                             ),
//                             Text(
//                               // 'id',
//                               '${widget.getMostPurchasedProducts.id} ',
//                               style: Styles.style18,
//                             ),
//                             const Spacer(
//                               flex: 6,
//                             ),
//                             Text(
//                               '${widget.getMostPurchasedProducts.productPrice}'
//                               '  s.p ',
//                               style: Styles.style18,
//                             ),
//                             const Spacer(
//                               flex: 2,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 left: 0,
//                 top: -130,
//                 // NetworkImage('${product.image1}'),
//                 // child: Text('${product.image1}'),
//                 // child: Image.network('${product.image}'),
//                 child: Container(
//                   clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   height: 200,
//                   width: 200,
//                   child: ImageWithAuth(
//                     imageUrl: widget.getMostPurchasedProducts.image1!,
//                     username: '11184828',
//                     password: '60-dayfreetrial',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class RowWithIconsppp extends StatefulWidget {
//   RowWithIconsppp(
//       {super.key,
//       this.nextPageInIconDetail,
//       this.isDisplayFlotaingButton = false,
//       this.isShowSubCategory = false,
//       this.title,
//       this.id,
//       required this.onTap,
//       required this.onpressed,
//       this.image,
//       this.child
//       // required this.onEdit
//       });
//   String? nextPageInIconDetail;
//   String? title;
//   int? id;
//   String? image;
//   final bool isShowSubCategory;
//   final bool isDisplayFlotaingButton;
//   final Function() onTap;
//   final Function() onpressed;
//   // final Function() onEdit;
//   IconButton? child;
//   @override
//   State<RowWithIcons> createState() => _RowWithIconsState();
// }

// class _RowWithIconsState extends State<RowWithIcons> {
//   bool isHoveredIconDelete = false;
//   bool isHoveredIconEdite = false;
//   bool isHoveredIconDetails = false;
//   bool isHoveredIconAdd = false;
//   // final void Function() onTap;
//   //  int id=widget.id;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Spacer(
//           flex: 1,
//         ),
//         Text(
//           "${widget.title}",
//           style: const TextStyle(fontSize: 25),
//         ),
//         const Spacer(
//           flex: 3,
//         ),
//         MouseRegion(
//           onEnter: (event) {
//             setState(() {
//               isHoveredIconDelete = true;
//             });
//           },
//           onExit: (event) {
//             setState(() {
//               isHoveredIconDelete = false;
//             });
//           },
//           child: Container(
//             child: IconButton(
//               onPressed:
//                   // print('del');
//                   widget.onTap,
//               icon: Icon(
//                 Icons.delete_forever,
//                 size: isHoveredIconDelete ? 27 : 23,
//               ),
//             ),
//           ),
//         ),
//         const Spacer(
//           flex: 1,
//         ),
//         MouseRegion(
//           onEnter: (event) {
//             setState(() {
//               isHoveredIconEdite = true;
//             });
//           },
//           onExit: (event) {
//             setState(() {
//               isHoveredIconEdite = false;
//             });
//           },
//           child: widget.child,
//           // child: IconButton(
//           //   onPressed: widget.onEdit,
//           //   // () {

//           //   // context.goNamed(
//           //   //   'edit_category_main_view_body',
//           //   //   pathParameters: {
//           //   //     'category_id': widget.id.toString(),
//           //   //     'category_image': widget.image!,
//           //   //     'category_title': widget.title!,
//           //   //   },
//           //   // );
//           //   // print('the id is:' + '${widget.id}');
//           //   // buildShwoDialogEdit(
//           //   // context, widget.id.toString(), widget.image!, widget.title!);
//           //   // },
//           //   icon: Icon(
//           //     Icons.edit,
//           //     size: isHoveredIconEdite ? 27 : 23,
//           //   ),
//           // ),
//         ),
//         const Spacer(
//           flex: 1,
//         ),
//         if (widget.isDisplayFlotaingButton)
//           MouseRegion(
//             onEnter: (event) {
//               setState(() {
//                 isHoveredIconAdd = true;
//               });
//             },
//             onExit: (event) {
//               isHoveredIconAdd = false;
//             },
//             child: IconButton(
//               onPressed: () {
//                 context.go('${widget.nextPageInIconDetail}');
//               },
//               icon: Icon(Icons.add_circle_outlined,
//                   size: isHoveredIconAdd ? 27 : 23),
//             ),
//           ),
//         if (widget.isShowSubCategory)
//           MouseRegion(
//             onEnter: (event) {
//               setState(() {
//                 isHoveredIconDetails = true;
//               });
//             },
//             onExit: (event) {
//               isHoveredIconDetails = false;
//             },
//             child: IconButton(
//               onPressed: widget.onpressed,
//               // onPressed: () {
//               //   context.go('${widget.nextPageInIconDetail}');
//               //   print('Hellllllllllllllllllllllllllllllll\n');
//               //   // print(widget.id);
//               // },
//               icon: Icon(Icons.arrow_circle_left_outlined,
//                   size: isHoveredIconDetails ? 32 : 27),
//             ),
//           ),
//         const Spacer(
//           flex: 1,
//         ),
//       ],
//     );
//   }
// }
