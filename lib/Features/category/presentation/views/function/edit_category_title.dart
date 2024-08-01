import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart'; // لتحديد إذا كنا نعمل على الويب
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class EditCategoryMainViewBody extends StatefulWidget {
  EditCategoryMainViewBody(
      {super.key, required this.id, required this.image, required this.title});
  @override
  String id;
  String title;
  String image;
  @override
  State<EditCategoryMainViewBody> createState() =>
      _EditCategoryMainViewBodyState();
}

class _EditCategoryMainViewBodyState extends State<EditCategoryMainViewBody> {
  XFile? _image;
  final _picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false;
  String? _response;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {

    // } else {
    //   print('No image selected.');
    // }
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> _uploadImage() async {
    // if (_image == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // final filePath = _image!.path;
      // final compressedImage = await FlutterImageCompress.compressWithFile(
      //   filePath,
      //   minHeight: 800,
      //   minWidth: 800,
      //   quality: 90,
      // );
      // final String base64Image = base64Encode(compressedImage!.toList());
      //

      // تحويل الصورة إلى base64
      //
      final bytes = await _image!.readAsBytes();
      final String base64Image = base64Encode(bytes);

      // إعداد البيانات لإرسالها إلى الـ API
      final String title = _textController.text;

      // if (title.isEmpty) {
      //   print(' t tnull');
      // }

      // if (compressedImage == null) {
      //   print('imag tnull');
      // }
      Map<String, dynamic> data; // تعريف المتغير هنا

      if (_image == null) {
        data = {'title1': title ?? widget.title, 'image': base64Image};
      } else {
        data = {'title1': title ?? widget.title, 'image': base64Image};
      }

      const String username = '11184828';
      const String password = '60-dayfreetrial';
// التأكد من أن البيانات التي نرسلها صحيحة
      // print('Data being sent to the API: $data');

      // if (_image == null) {
      //   final Map<String, dynamic> data = {
      //     'title1': title ?? widget.title,
      //   };
      // } else {
      //   final Map<String, dynamic> data = {
      //     'title1': title ?? widget.title,
      //     'image': base64Image
      //   };
      // }
      // const String username = '11184828';
      // const String password = '60-dayfreetrial';
      // التأكد من أن البيانات التي نرسلها صحيحة
      // print('Data being sent to the API: $data');

      // إرسال البيانات إلى الـ API
      String apiUrl =
          'http://yomnabaksmawi-001-site1.ltempurl.com/api/category/update/${widget.id}';
      print('ddddddddddddddddddddddddddddddddddddddddddddddddddddddd' +
          widget.id);
      final response = await http.post(
        Uri.parse(apiUrl),
        // headers: {'Content-Type': 'application/json'},
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$username:$password'))}',
        },
        body: jsonEncode(data),
      );

      setState(() {
        _isLoading = false;
        _response = response.statusCode == 200
            ? 'Upload Successful!'
            : 'Upload Failed: ${response.body}';
      });
      message(context, 'تم تعديل الصنف بنجاح');
      context.replace('/category_main_all');
      // طباعة الرد من الخادم لتحليل الأخطاء
      print('API Response: ${response.body}');
    } catch (e) {
      setState(() {
        _isLoading = false;
        _response = 'Upload Failed: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is EditCategorySuccess) {
          context.replace('/category_main_all_body');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('إضافة صنف '),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Form(
                  key: context.read<CategoryCubit>().formkey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)),
                    width: 400,
                    child: Column(
                      children: [
                        if (_image != null)
                          kIsWeb
                              ? FutureBuilder(
                                  future: _image!.readAsBytes(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasError) {
                                        return const Text(
                                            "Error loading image");
                                      }
                                      final bytes = snapshot.data as Uint8List;
                                      return Image.memory(bytes);
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                )
                              : Image.file(File(_image!.path)),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            labelText: 'عدل اسم الصنف',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _pickImage,
                          child: const Text(' اختيار صورة'),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            _uploadImage();
                          },
                          child: _isLoading
                              ? const CircularProgressIndicator()
                              : const Text('رفع '),
                        ),
                        if (_response != null) ...[
                          const SizedBox(height: 16.0),
                          Text(_response!),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';

// buildShwoDialogEdit(
//     BuildContext context, String id, String image, String title) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       // هذا الحوار يحتوي على النص الكامل داخل SingleChildScrollView
//       return SizedBox(
//         width: 200,
//         child: AlertDialog(
//           content: const SingleChildScrollView(
//             child: Text(
//               "تعديل",
//             ),
//           ),
//           actions: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 // color: backgroundColorIamge
//               ),
//               // width: 300,
//               // height: 300,
//               child: TextButton(
//                 onPressed: () {
//                   // context
//                   //     .read<AddInstractionCubit>()
//                   //     .selectImage(context);
//                 },
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.add_photo_alternate,
//                       size: 25,
//                       // color: backgroundColorIamgeText,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       'اختر صورة الصنف',
//                       style: TextStyle(
//                           // color: ,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             TextFormField(
//               keyboardType: TextInputType.name,
//               validator: (value) {
//                 return null;
//               },
//               decoration: const InputDecoration(
//                 labelText: 'أدخل اسم الصنف',
//               ),
//             ),
//             Row(
//               children: [
//                 TextButton(
//                   child: const Text('اغلاق'),
//                   onPressed: () {
//                     Navigator.of(context).pop(); // يغلق الحوار
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('حفظ'),
//                   onPressed: () {
//                     context
//                         .read<CategoryCubit>()
//                         .editCategoryFunction(context, id, image: image);
//                     // Navigator.of(context).pop(); // يغلق الحوار
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
//     },
//   );
// }
