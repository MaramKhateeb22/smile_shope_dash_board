import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/home_view_body.dart';

import 'package:smile_shope_dash_board/core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  HomeViewBody(),
    );
  }
}