import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:smile_shope_dash_board/core/widgets/custom_app_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SignUpViewBody(),
    );
  }
}