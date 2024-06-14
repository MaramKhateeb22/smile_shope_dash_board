// import '../utils/styles.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

AppBar buildAppBar(
    {final String? title, final bool isActionAdd = false, context}) {
  return AppBar(
    actions: [
      if (isActionAdd)
        Container(
          margin: const EdgeInsets.all(15),
          child: FloatingActionButton(
            backgroundColor: colorGrey,
            splashColor: const Color.fromARGB(255, 222, 221, 221),
            hoverColor: Colors.grey,
            tooltip: "إضافة صنف",
            onPressed: () {
              context.go('/add_category_main_view_body');
              // Add your onPressed code here!
            },
            child: const Icon(Icons.add),
          ),
        ),

      // FloatingActionButton.extended(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   label: const Text('Add'),
      //   icon: const Icon(Icons.add),
      // ),
    ],
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
