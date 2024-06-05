import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';

buildShwoDialogDelete(BuildContext context, int? id) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      // هذا الحوار يحتوي على النص الكامل داخل SingleChildScrollView
      return AlertDialog(
        content: const SingleChildScrollView(
          child: Text(
            'حقا تريد الحذف؟!',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('اغلاق'),
            onPressed: () {
              Navigator.of(context).pop(); // يغلق الحوار
            },
          ),
          TextButton(
            child: const Text('نعم '),
            onPressed: () {
              // setState(() {});
              context
                  .read<ProductCubit>()
                  .deleteProductFunction(id!.toString(), context);

              // //function Delete
              Navigator.of(context).pop();
              // يغلق الحوار
            },
          ),
        ],
      );
    },
  );
}
