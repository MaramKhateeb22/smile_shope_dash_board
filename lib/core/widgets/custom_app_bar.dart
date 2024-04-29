// import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    // leading: Center(
    //   child: SvgPicture.asset(
    //     'assets/images/arrow.svg',
    //     height: 15,
    //   ),
    // ),

    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      // style: Styles.style25,
    ),

  );

}
