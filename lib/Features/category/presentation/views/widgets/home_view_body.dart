import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../product/presentation/views/all_product_view.dart';
import '../add_category_main_view.dart';
import '../category_main_all.dart';
import 'category_main_all_body.dart';


class HomeViewBody extends StatefulWidget {

  HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Widget> screens = [CategoryMainAllBody(),addCategoryMainView(),AllProductView()];

  late Widget _body = CategoryMainAllBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الصفحة الرئيسية '),
        ),
        drawer: Drawer(
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 100,
                  child: const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                ),
                ExpansionTile(title: Text('الاصناف الرئيسية'), children: [
                  ListTile(
                    title: Text('كل الأصناف'),
                    leading: Icon(Icons.category_outlined),

                    // subtitle: Text(),

                    onTap: () {
                      // Navigator.of(context).pop(); // إغلاق ال Drawer يدوياً
                      setState(() {
                        _body = CategoryMainAll();
                      });
                      // context.go(screens[0]);
                    },
                  ),
                  ListTile(
                    title: Text('إضافة صنف رئيسي'),
                    leading: Icon(Icons.category_outlined),
                    onTap: () {
                      // Navigator.of(context).pop(); // إغلاق ال Drawer يدوياً
                      setState(() {
                        _body = screens[1];
                      });
                    },
                  ),
                ]),
                const Divider(
                  height: 0,
                ),
                ExpansionTile(title: Text('المنتجات'),
                  children: [
                    ListTile(
                      onTap: (){
                        setState(() {
                          _body = screens[2];
                        });
                      },
                      title: Text('كل المنتجات'),
                      leading: Icon(Icons.align_horizontal_left_rounded),
                    ), ListTile(
                      onTap: (){},
                      title: Text('إضافة منتج'),
                      leading: Icon(Icons.add_circle_outline),
                    ),
                  ],
                )
                ,
                const Divider(
                  height: 0,
                ),

              ],),
        ),
      body: _body,
  );
  }
}
