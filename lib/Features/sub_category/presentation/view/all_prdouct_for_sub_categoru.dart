// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/auth_network_image.dart';
// import 'package:smile_shope_dash_board/Features/sub_category/data/model/all_product_for_sub_category_model.dart';
// import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
// import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_state.dart';
// import 'package:smile_shope_dash_board/core/utils/constants.dart';
// import 'package:smile_shope_dash_board/core/widgets/custom_app_bar.dart';
// import 'package:smile_shope_dash_board/core/widgets/row_with_icons_for_card_product_or_category.dart';

// class AllProductForSubCategory extends StatefulWidget {
//   AllProductForSubCategory({super.key, required this.id});
//   int? id;
//   // ProductGetAllModel? product;

//   @override
//   State<AllProductForSubCategory> createState() =>
//       _AllProductForSubCategoryState();
// }

// class _AllProductForSubCategoryState extends State<AllProductForSubCategory> {
//   // داخل الصفحة الثانية، قد تتمكن من الحصول على id بهذه الطريقة (اعتمادًا على إعداد الrouter):
//   @override
//   Widget build(BuildContext context) {
//     // final id = ModalRoute.of(context)!.settings.arguments;
//     return Scaffold(
//       appBar: buildAppBar(
//         title: 'المنتجات ',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: FutureBuilder<dynamic>(
//           future: context.read<SubCategoryCubit>().getAllproductForSubCategory(
//               widget.id.toString()), // الوظيفة التي تحصل على البيانات من API
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               print(snapshot.error);
//               return Center(child: Text('يوجد خطأ: ${snapshot.error}'));
//             } else {
//               List<AllProductForSubCategoryModel?> allSubCategory =
//                   context.read<SubCategoryCubit>().allProductForSubCategory!;
//               return BlocConsumer<SubCategoryCubit, SubCategoryState>(
//                 listener: (context, state) {
//                   if (state is GetAllProductForSubCateSuccessState) {
//                     setState(() {});
//                   }
//                 },
//                 builder: (context, state) {
//                   return GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: MediaQuery.of(context).size.width > 1115
//                             ? 4
//                             : MediaQuery.of(context).size.width > 650
//                                 ? 2
//                                 : 1,
//                         // crossAxisCount: 4,
//                         childAspectRatio: 1 / 1.45,
//                         crossAxisSpacing: 20,
//                         mainAxisSpacing: 20),
//                     itemCount: allSubCategory.length,
//                     itemBuilder: (context, index) {
//                       // categoryid = allSubCategory[index].id!;
//                       return ProductForSubCatergoryWidget(
//                         // product:allSubCategor!,
//                         // textbutton: '',
//                         // textbutton: 'إضافة منتج',
//                         id: allSubCategory[index]!.id!,
//                         isButton: true,
//                         isShowSubCategory: true,
//                         isDisplayFlotaingButton: false,
//                         nextPageInIconDetail: '/sub_category_view',
//                         title: allSubCategory[index]!.productName!,
//                         image: allSubCategory[index]!.image1!,
//                       );
//                     },
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class ProductForSubCatergoryWidget extends StatefulWidget {
//   ProductForSubCatergoryWidget(
//       {super.key,
//       required this.isButton,
//       required this.isShowSubCategory,
//       this.nextPageInIconDetail,
//       required this.isDisplayFlotaingButton,
//       this.title,
//       // this.data,
//       // required this.product,
//       required this.image,
//       required this.id,
//       this.textbutton});
//   bool isButton = false;
//   String? nextPageInIconDetail;
//   bool isShowSubCategory = false;
//   final bool isDisplayFlotaingButton;
//   String? title;
//   String image;
//   // CategoryGetAllModle dd;
//   int? id;
//   // Data? data;
//   String? textbutton;
//   // ProductGetAllModel product;
// //  ProductGetAllModel product;
//   @override
//   State<ProductForSubCatergoryWidget> createState() =>
//       _ProductForSubCatergoryWidgetState();
// }

// class _ProductForSubCatergoryWidgetState
//     extends State<ProductForSubCatergoryWidget> {
//   bool isHoveredCard = false;
//   bool isHoveredIconDelete = false;
//   bool isHoveredIconEdite = false;
//   bool isHoveredIconDetails = false;
//   bool isHoveredIconAdd = false;
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) {
//         setState(
//           () {
//             isHoveredCard = true;
//           },
//         );
//       },
//       onExit: (event) {
//         setState(
//           () {
//             isHoveredCard = false;
//           },
//         );
//       },
//       child: Card(
//         elevation: isHoveredCard ? 20 : 2, // تغيير ارتفاع الحاشية عند hover
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15), color: Colors.white),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: 300,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           topRight: Radius.circular(15),
//                         ),
//                         color: colorGrey),
//                     // child:Image.network(widget.data.)
//                     child: ImageWithAuth(
//                       imageUrl: widget.image,
//                       username: '11184828',
//                       password: '60-dayfreetrial',
//                     ),
//                     // child:  Image(
//                     //   image: NetworkImage(
//                     // widget.image,
//                     //   ),
//                     //   fit: BoxFit.cover,
//                     // ),
//                   ),
//                   Positioned(
//                     child: Container(
//                       color: Colors.grey.shade50,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               RowWithIcons(
//                 image: widget.image,
//                 onpressed: () {
//                   // context.goNamed(
//                   // "detail_product_view",
//                   // extra: product,
//                   // );
//                   // print('The product is :' + '$product');
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) =>
//                   //         AllProductForSubCategory(id: widget.id),
//                   //   ),
//                   // );
//                   // // context.go('${widget.nextPageInIconDetail}/${widget.id}');
//                   // // context.go('${widget.nextPageInIconDetail}');
//                   // print(widget.id);
//                 },
//                 // print('dllllldiejflejfaljoiejofjel'+'${widget.data!.id}'),
//                 //delelte
//                 onTap: () {
//                   print('deleteeee SubCategory');
//                   // context
//                   // .read<CategoryCubit>()
//                   // .deleteCategoryFunction(widget.id.toString(), context);
//                   print(widget.id);
//                   // buildShwoDialogDelete(context, widget.id);
//                 },
//                 // id: widget.data?.id,
//                 id: widget.id,
//                 title: widget.title,
//                 nextPageInIconDetail: widget.nextPageInIconDetail,
//                 isShowSubCategory: widget.isShowSubCategory,
//                 isDisplayFlotaingButton: widget.isDisplayFlotaingButton,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/all_product_for_sub_category_model.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_state.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/view/widget/custom_all_product_for_sub_widget.dart';

class AllProductForSubCategory extends StatefulWidget {
  AllProductForSubCategory({super.key, required this.id});
  int? id;
  @override
  State<AllProductForSubCategory> createState() =>
      _AllProductForSubCategoryState();
}

class _AllProductForSubCategoryState extends State<AllProductForSubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 80, top: 50, left: 80),
        child: FutureBuilder<dynamic>(
          future: context.read<SubCategoryCubit>().getAllproductForSubCategory(
              widget.id.toString()), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // else if (snapshot.hasError) {
            //   return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            // }
            else {
              // List<AllProductForSubCategoryModel?> allSubCategory =
              // context.read<SubCategoryCubit>().allProductForSubCategory!;
              List<AllProductForSubCategoryModel> allSubCategory =
                  context.read<SubCategoryCubit>().allProductForSubCategory!;
              // print(
              // "kkkkkkkkkkkkkkkkkkkkkkkkkkkallproduct" "${allProduct.data}");
              return BlocConsumer<SubCategoryCubit, SubCategoryState>(
                listener: (context, state) {
                  // if (state is DeleteSuccessState) {
                  //   message(context, 'تم الحذف بنجاح ');
                  // }
                  // setState(() {});
                },
                builder: (context, state) {
                  return GridView.builder(
                    itemCount: allSubCategory.length,
                    itemBuilder: (context, index) {
                      return CustomAllProductWidgetForSubCategory(
                        productforsubcategory: allSubCategory[index],
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 40,
                      childAspectRatio: 2 / 1.6,
                      crossAxisSpacing: 60,
                      crossAxisCount: 3,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
