import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                child: Text('Drawer Header'),
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
                    setState(
                      () {
                        context.go('/all_product_view');
                        _body = screens[2];
                      },
                    );
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
          ],
        ),
      ),
      body: _body,
    );
  }
}
