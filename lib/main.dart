import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Features/category/presentation/views/homw_view.dart';
import 'Features/category/presentation/views/widgets/category_main_all_body.dart';
import 'Features/category/presentation/views/sub_category_view.dart';
import 'Features/product/presentation/views/add_product_view.dart';


void main() {
  runApp(const MyApp());
}
final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      }
    ),
    GoRoute(
        path: '/category_main_all',
        builder: (BuildContext context, GoRouterState state) {
          return const CategoryMainAllBody();
        }
    ),
    GoRoute(
        path: '/sub_category_view',
        builder: (BuildContext context, GoRouterState state) {
          return const SubGategoryView();
        }
    ),
    GoRoute(
        path: '/add_product_view',
        builder: (BuildContext context, GoRouterState state) {
          return const AddProductView();
        }
    ),
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        listTileTheme: ListTileThemeData(
          iconColor: Colors.orange
        ),
        iconTheme: IconThemeData(

          color: Colors.orange
        )
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],

      locale: const Locale("ar", "AE"),
       routerConfig: _router,

    );
  }
}
