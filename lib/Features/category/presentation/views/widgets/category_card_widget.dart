import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/services/category_get_all_service.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Container(

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.white),
     
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  color: colorGrey),

                  child: const Image(

                    image: AssetImage('assets/images/photo1.png',),
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.grey.shade50,
                  ),
                ),

              ],
            ),
               SizedBox(height: 15,),

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Spacer(flex: 1,),
                 Text('أحذية',style: TextStyle(fontSize:25 ),),
                 Spacer(flex: 3,),
                 Icon(Icons.delete_forever),
                 Spacer(flex: 1,),
                 Icon(Icons.edit),
                 Spacer(flex: 1,),
                 Icon(Icons.arrow_circle_left_outlined),
                 Spacer(flex: 1,),
               ],

             ),SizedBox(height: 10,),
             ElevatedButton(
               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorGrey)),
               onPressed: () {},
               child: Text('اضافة قسم'),
             )
          ],
        ),
      ),
    );
  }
}
