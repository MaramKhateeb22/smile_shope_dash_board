
import 'package:flutter/material.dart';

buildShwoDialogDelete(BuildContext context){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      // هذا الحوار يحتوي على النص الكامل داخل SingleChildScrollView
      return AlertDialog(
        content: SingleChildScrollView(
          child: Text(
            'حقا تريد الحذف؟!',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('اغلاق'),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // يغلق الحوار
            },
          ),
          TextButton(
            child: const Text('نعم '),
            onPressed: () {
              //function Delete
              Navigator.of(context)
                  .pop(); // يغلق الحوار
            },
          ),
        ],
      );
    },
  );
}