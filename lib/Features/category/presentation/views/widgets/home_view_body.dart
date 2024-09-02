import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/views/add_color_view.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/views/all_color_view.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/views/all_MostPurchasedProducts.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/views/all_number.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/views/all_payment_proof.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/views/get_all_order_paid_view.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/views/get_all_order_unpaid_view.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/views/get_all_order_view.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/views/add_size_view.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/views/all_size_view.dart';
import 'package:smile_shope_dash_board/Features/users/presentation/view/all_users.dart';

import '../../../../product/presentation/views/add_product_view.dart';
import '../../../../product/presentation/views/all_product_view.dart';
import '../add_category_main_view.dart';
import '../category_main_all.dart';
import 'category_main_all_body.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Widget> screens = [
    const CategoryMainAllBody(),
    const addCategoryMainView(),
    const AllProductView(),
    const AddProductView(),
    const AddSizeView(),
    const AllSizeView(),
    const AllColorView(),
    const AddColorView(),
    const AllUsers(),
    const GetAllOrder(),
    const AllPaymentProof(),
    const GetMostPurchasedProductView(),
    const GetAllOrderPaid(),
    const GetAllOrderUnPaid(),
    const AllNumberView()
  ];

  late Widget _body = const CategoryMainAllBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية '),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('الصفحة الرئيسية'),
              ),
            ),
            ExpansionTile(
              title: const Text('الاصناف الرئيسية'),
              children: [
                ListTile(
                  title: const Text('كل الأصناف'),
                  leading: const Icon(Icons.category_outlined),
                  // subtitle: Text(),
                  onTap: () {
                    // Navigator.of(context).pushNamed(
                    //     '/category_main_all'); // إغلاق ال Drawer يدوياً
                    setState(
                      () {
                        _body = const CategoryMainAll();
                      },
                    );
                    // context.go(screens[0]);
                  },
                ),
                ListTile(
                  title: const Text('إضافة صنف رئيسي'),
                  leading: const Icon(Icons.category_outlined),
                  onTap: () {
                    // Navigator.of(context).pop(); // إغلاق ال Drawer يدوياً
                    // setState(
                    // () {
                    // context.go('/category_main_all_body');
                    context.go('/add_category_main_view');
                    _body = screens[1];
                    // },
                    // );
                  },
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            ExpansionTile(
              title: const Text('المنتجات'),
              children: [
                ListTile(
                  onTap: () {
                    context.go('/all_product_view');
                    _body = screens[2];
                    // setState(
                    //   () {

                    //   },
                    // );
                  },
                  title: const Text('كل المنتجات'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                ListTile(
                  onTap: () {
                    // setState(
                    // () {

                    // },
                    context.go('/add_product_view');
                    _body = screens[3];
                    // );
                  },
                  title: const Text('إضافة منتج'),
                  leading: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            ExpansionTile(
              title: const Text('الاحجام'),
              children: [
                ListTile(
                  onTap: () {
                    context.go('/all_size_view');
                    _body = screens[5];
                    // setState(
                    //   () {

                    //   },
                    // );
                  },
                  title: const Text('كل الاحجام'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                ListTile(
                  onTap: () {
                    // setState(
                    // () {

                    // },
                    context.go('/add_size_view');
                    _body = screens[4];
                    // );
                  },
                  title: const Text('إضافة حجم'),
                  leading: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            ExpansionTile(
              title: const Text('الالوان'),
              children: [
                ListTile(
                  onTap: () {
                    context.go('/all_color_view');
                    _body = screens[6];
                    // setState(
                    //   () {

                    //   },
                    // );
                  },
                  title: const Text('كل الالوان'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                ListTile(
                  onTap: () {
                    // setState(
                    // () {

                    // },
                    context.go('/add_color_view');
                    _body = screens[7];
                    // );
                  },
                  title: const Text('إضافة لون'),
                  leading: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            ExpansionTile(
              title: const Text('المستخدمين'),
              children: [
                ListTile(
                  onTap: () {
                    context.go('/all_users_view');
                    _body = screens[8];
                  },
                  title: const Text('كل المستخدمين'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            ExpansionTile(
              title: const Text('كل الفواتير'),
              children: [
                ListTile(
                  onTap: () {
                    context.go('/all_order_view');
                    _body = screens[9];
                  },
                  title: const Text('  كل الفواتير'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                ListTile(
                  onTap: () {
                    context.go('/all_order_paid_view');
                    _body = screens[11];
                  },
                  title: const Text(' الفواتير المدفوعة'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                ListTile(
                  onTap: () {
                    context.go('/all_order_Unpaid_view');
                    _body = screens[12];
                  },
                  title: const Text(' الفواتير غير المدفوعة'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                ListTile(
                  onTap: () {
                    context.go('/all_payment_proof');
                    _body = screens[10];
                  },
                  title: const Text(' إثبات الدفع  '),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                const Divider(
                  height: 0,
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            ExpansionTile(
              title: const Text('الاحصائيات'),
              children: [
                ListTile(
                  onTap: () {
                    context.go('/get_most_purchased_product');
                    _body = screens[10];
                  },
                  title: const Text('  المنتجات الاكثر شراء'),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                ListTile(
                  onTap: () {
                    context.go('/get_all_number');
                    _body = screens[14];
                  },
                  title: const Text(' كامل الاحصائيات   '),
                  leading: const Icon(Icons.align_horizontal_left_rounded),
                ),
                const Divider(
                  height: 0,
                ),
              ],
            ),
          ],
        ),
      ),
      body: _body,
    );
  }
}
