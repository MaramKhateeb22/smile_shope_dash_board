 import 'package:flutter/material.dart';
 buildShwoDialogEdit(BuildContext context){
  return  showDialog(
    context: context,
    builder: (BuildContext context) {
      // هذا الحوار يحتوي على النص الكامل داخل SingleChildScrollView
      return Container(
        width: 200,

        child: AlertDialog(
          content: SingleChildScrollView(
            child: Text(
              "تعديل",
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: backgroundColorIamge
              ),
              // width: 300,
              // height: 300,
              child: TextButton(
                onPressed: () {
                  // context
                  //     .read<AddInstractionCubit>()
                  //     .selectImage(context);
                },
                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate,
                      size: 25,
                      // color: backgroundColorIamgeText,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'اختر صورة الصنف',
                      style: TextStyle(
                        // color: ,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              validator: (value) {},
              decoration: InputDecoration(
                labelText: 'أدخل اسم الصنف',
              ),
            ),
            Row(
              children: [
                TextButton(
                  child: const Text('اغلاق'),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // يغلق الحوار
                  },
                ),
                TextButton(
                  child: const Text('حفظ'),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // يغلق الحوار
                  },
                ),
              ],
            )
          ],
        ),
      );
    },
  );
 }