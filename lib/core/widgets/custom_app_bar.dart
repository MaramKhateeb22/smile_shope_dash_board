// import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';

AppBar buildAppBar({final String? title,final bool isActionAdd=false}) {


  return AppBar(
     actions: [
       if(isActionAdd)
         Container(
        margin: EdgeInsets.all(15),
        child: FloatingActionButton(
          
          backgroundColor: colorGrey,
          splashColor: Colors.amber,
          hoverColor: Colors.pink,
          tooltip: "إضافة قسم",
          onPressed: () {
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
