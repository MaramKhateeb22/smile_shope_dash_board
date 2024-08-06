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
import 'package:smile_shope_dash_board/Features/colorproduct/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/views/add_color_view.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/views/all_color_view.dart';
import 'package:smile_shope_dash_board/Features/colorproduct/presentation/views/edit_color_view.dart';
import 'package:smile_shope_dash_board/Features/product/data/model/product_get_all_model.dart';
import 'package:smile_shope_dash_board/Features/product/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/views/detail_product_view.dart';
import 'package:smile_shope_dash_board/Features/size/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/manager/cubit/cubit.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/views/add_size_view.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/views/all_size_view.dart';
import 'package:smile_shope_dash_board/Features/size/presentation/views/edit_size_view.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/model/all_product_for_sub_category_model.dart';
import 'package:smile_shope_dash_board/Features/sub_category/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/view/widget/detail_all_product_for_subCategory.dart';
import 'package:smile_shope_dash_board/Features/users/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/users/presentation/manager/cubit.dart';
import 'package:smile_shope_dash_board/Features/users/presentation/view/all_users.dart';

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
        ProductGetAllModel product = state.extra as ProductGetAllModel;
        return DetailProductView(
          product: product,
        );
      },
    ),
    GoRoute(
      path: '/detail_product_Sub_view',
      name: 'detail_product_Sub_view',
      builder: (BuildContext context, GoRouterState state) {
        AllProductForSubCategoryModel productforsub =
            state.extra as AllProductForSubCategoryModel;
        return DetailProductForsubcategoryViewBody(
          product: productforsub,
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
    // GoRoute(
    //   path:
    //       '/edit_product_main_view_body/:category_id/:category_image/:category_title',
    //   name: 'edit_product_main_view_body',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return EditProductView(
    //       id: state.pathParameters['category_id']!,
    //       image: state.pathParameters['category_image']!,
    //       title: state.pathParameters['category_title']!,
    //     );
    // },
    // ),
    //size Route
    GoRoute(
      path: '/add_size_view',
      builder: (BuildContext context, GoRouterState state) {
        return const AddSizeView();
      },
    ),
    GoRoute(
      path: '/all_size_view',
      builder: (BuildContext context, GoRouterState state) {
        return const AllSizeView();
      },
    ),
    GoRoute(
      path: '/edit_size_view_body/:size_name/:size_id',
      name: 'edit_size_view_body',
      builder: (BuildContext context, GoRouterState state) {
        return EditSizeView(
          id: state.pathParameters['size_id']!,
          sizeName: state.pathParameters['size_name']!,
        );
      },
    ),
    //color Route
    GoRoute(
      path: '/add_color_view',
      builder: (BuildContext context, GoRouterState state) {
        return const AddColorView();
      },
    ),
    GoRoute(
      path: '/all_color_view',
      builder: (BuildContext context, GoRouterState state) {
        return const AllColorView();
      },
    ),
    GoRoute(
      path: '/edit_color_view_body/:color_name/:color_id',
      name: 'edit_color_view_body',
      builder: (BuildContext context, GoRouterState state) {
        return EditColorView(
          id: state.pathParameters['color_id']!,
          colorName: state.pathParameters['color_name']!,
        );
      },
    ),
    GoRoute(
      path: '/all_users_view',
      builder: (BuildContext context, GoRouterState state) {
        return const AllUsers();
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
          create: (context) => ProductCubit(
            ProductRepo(
              api: DioConsumer(dio: Dio()),
            ),
          ),
        ),
        BlocProvider<SubCategoryCubit>(
          create: (context) => SubCategoryCubit(
            SubCategoryRepositry(
              api: DioConsumer(dio: Dio()),
            ),
          ),
        ),
        BlocProvider<SizeCubit>(
          create: (context) => SizeCubit(
            SizeRepo(
              api: DioConsumer(dio: Dio()),
            ),
          ),
        ),
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(
            ColorRepo(
              api: DioConsumer(dio: Dio()),
            ),
          ),
        ),
        BlocProvider<AllUsersCubit>(
          create: (context) => AllUsersCubit(
            UsersRepositry(
              api: DioConsumer(dio: Dio()),
            )
              ..numberUsers()
              ..usersGetAll(),
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
