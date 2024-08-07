import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/auth_network_image.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/data/model/getMostPurchasedProducts_model.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/manager/cubit.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/manager/state.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/number_product_model.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/state.dart';

class GetMostPurchasedProductView extends StatefulWidget {
  const GetMostPurchasedProductView({super.key});
  // {super.key, required this.getMostPurchasedProducts});
  // getMostPurchasedProductsModel getMostPurchasedProducts;

  @override
  State<GetMostPurchasedProductView> createState() =>
      _AllProductViewBodyState();
}

class _AllProductViewBodyState extends State<GetMostPurchasedProductView> {
  @override
  void initState() {
    context.read<ProductCubit>().getNumberProductsCubit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 80, top: 50, left: 80),
        child: FutureBuilder<dynamic>(
          future: context
              .read<GetMostPurchasedProductsCubit>()
              .getMostPurchasedProductsCubit(), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // else if (snapshot.hasError) {
            //   return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            // }
            else {
              List<getMostPurchasedProductsModel> getMostPurchasedProducts =
                  context
                      .read<GetMostPurchasedProductsCubit>()
                      .getMostPurchasedProductsmodel!;
              NumberPorductModel numberPorduct =
                  context.read<ProductCubit>().numberproduct!;
              // print(
              // "kkkkkkkkkkkkkkkkkkkkkkkkkkkallproduct" "${allProduct.data}");
              return BlocConsumer<GetMostPurchasedProductsCubit,
                  GetMostPurchasedProductsState>(
                listener: (context, state) {
                  // if (state is DeleteSuccessState) {
                  //   message(context, 'تم الحذف بنجاح ');
                  // }
                  // setState(() {});
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            if (state is numberProductSuccessState) {
                              return Text(
                                '  عدد المنتجات'
                                ' : '
                                '${state.numberPorductl.numberOfProducts}',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.red),
                              );
                            } else if (state is numberProductFailerState) {
                              return Text(state.error);
                            } else if (state is numberProductLoadingState) {
                              return const CircularProgressIndicator();
                            } else {
                              return Text(
                                ' عدد المنتجات  '
                                ' : '
                                '${numberPorduct.numberOfProducts}',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.red),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: getMostPurchasedProducts.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 200,
                                      width: 200,
                                      child: ImageWithAuth(
                                        imageUrl:
                                            '${getMostPurchasedProducts[index].image1}',
                                        username: '11184828',
                                        password: '60-dayfreetrial',
                                      ),
                                    ),
                                    // Image.network(
                                    // '${getMostPurchasedProducts[index].image1}'),

                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${getMostPurchasedProducts[index].id}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${getMostPurchasedProducts[index].productName}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'عدد مرات الشراء'
                                            ':'
                                            '${getMostPurchasedProducts[index].totalPurchases}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            'سعر المنتج  '
                                            ':'
                                            '${getMostPurchasedProducts[index].productPrice}'
                                            ' '
                                            'S.Y',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // product: getMostPurchasedProducts[index],
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 40,
                            childAspectRatio: 2 / 1.6,
                            crossAxisSpacing: 60,
                            crossAxisCount: 3,
                          ),
                        ),
                      ],
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
