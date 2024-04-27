import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('ome page'),),
        drawer: Drawer(
            child:
            ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
           const  DrawerHeader(
            decoration: BoxDecoration(
            color: Colors.blue,
            ),
               child: Text('Drawer Header'),
        ),
                ListTile(
                  title:  Text('كل المنتجات'),
                  onTap: () {

                  },
                ),
             const   Divider(
                  height: 0,
                ),
                ListTile(
                  title:  Text('أضف منتج'),
                  leading: CircleAvatar(child: Text('A')),

                  subtitle: Text('Supporting text'),

                  onTap: () {

                  },
                ),
        ]
    ),
        )
    );
  }
}