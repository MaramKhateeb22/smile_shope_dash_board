import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/category/data/repos/repo.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/add_category_main_view.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/category_main_all.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/function/edit_category_title.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/add_sub_category_view.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/Features/product/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/views/detail_product_view.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';

import 'Features/category/presentation/views/homw_view.dart';
import 'Features/category/presentation/views/sub_category_view.dart';
import 'Features/category/presentation/views/widgets/category_main_all_body.dart';
import 'Features/product/presentation/views/add_product_view.dart';
import 'Features/product/presentation/views/all_product_view.dart';
import 'core/utils/api/dio_consumer.dart';

void main() async {
  runApp(const MyApp());
}

// int? id;
final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/category_main_all_body',
      builder: (BuildContext context, GoRouterState state) {
        return const CategoryMainAllBody();
      },
    ),
    GoRoute(
      path: '/category_main_all',
      builder: (BuildContext context, GoRouterState state) {
        return const CategoryMainAll();
      },
    ),
    GoRoute(
      path: '/add_category_main_view',
      builder: (BuildContext context, GoRouterState state) {
        return const addCategoryMainView();
      },
    ),
    GoRoute(
      path: '/sub_category_view',
      builder: (BuildContext context, GoRouterState state) {
        return SubGategoryView();
      },
    ),
    GoRoute(
      path: '/add_product_view',
      builder: (BuildContext context, GoRouterState state) {
        return const AddProductView();
      },
    ),
    GoRoute(
      path: '/all_product_view',
      builder: (BuildContext context, GoRouterState state) {
        return const AllProductView();
      },
    ),
    // GoRoute(
    //   path: '/detail_product_view/:product_id',
    //   name: 'detail_product_view',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final productId = state.getParam(pathParameter: 'product_id');
    //     return DetailProductView(id: int.parse(productId));
    //   },
    // ),

    GoRoute(
      path: '/detail_product_view',
      name: 'detail_product_view',
      builder: (BuildContext context, GoRouterState state) {
        Data product = state.extra as Data;
        return DetailProductView(
          product: product,
        );
      },
    ),
    GoRoute(
      path: '/add_sub_category_view/:category_id',
      name: 'add_sub_category_view',
      builder: (BuildContext context, GoRouterState state) {
        return AddSubCategoryView(
          categoryId: state.pathParameters['category_id']!,
        );
      },
    ),
    GoRoute(
      path:
          '/edit_category_main_view_body/:category_id/:category_image/:category_title',
      name: 'edit_category_main_view_body',
      builder: (BuildContext context, GoRouterState state) {
        return EditCategoryMainViewBody(
          id: state.pathParameters['category_id']!,
          image: state.pathParameters['category_image']!,
          title: state.pathParameters['category_title']!,
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(
            CategoryRepositry(
              api: DioConsumer(
                dio: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(ProductRepo(
            api: DioConsumer(dio: Dio()),
          )),
        ),
        BlocProvider<SubCategoryCubit>(
          create: (context) => SubCategoryCubit(
            SubCategoryRepositry(
              api: DioConsumer(dio: Dio()),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
            listTileTheme: const ListTileThemeData(iconColor: Colors.orange),
            iconTheme: const IconThemeData(color: Colors.orange)),
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
        // routeInformationParser: _router.routeInformationParser,
        // routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
