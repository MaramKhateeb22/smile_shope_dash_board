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

class AddCategoryMainViewBody extends StatefulWidget {
  const AddCategoryMainViewBody({super.key});

  @override
  State<AddCategoryMainViewBody> createState() =>
      _AddCategoryMainViewBodyState();
}

class _AddCategoryMainViewBodyState extends State<AddCategoryMainViewBody> {
  XFile? _image;
  final _picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false;
  String? _response;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

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

      if (title.isEmpty) {
        print(' t tnull');
      }

      // if (compressedImage == null) {
      //   print('imag tnull');
      // }
      final Map<String, dynamic> data = {
        'title1': title,
        'image': base64Image,
      };
      const String username = '11184828';
      const String password = '60-dayfreetrial';
      // التأكد من أن البيانات التي نرسلها صحيحة
      print('Data being sent to the API: $data');

      // إرسال البيانات إلى الـ API
      const String apiUrl =
          'http://yomnabaksmawi-001-site1.ltempurl.com/api/category/add';
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
      message(context, 'تم إضافة الصنف بنجاح');
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
        if (state is AddCategorySuccess) {
          context.replace('/category_main_all_body');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('إضافة صنف رئيسي   '),
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
                            labelText: 'أدخل اسم الصنف',
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

//

//
//
//
//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
// import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';
// import 'package:http/http.dart';
//
//
// class addCategoryMainViewBody extends StatefulWidget {
//   const addCategoryMainViewBody({super.key});
//
//   @override
//   State<addCategoryMainViewBody> createState() => _addCategoryMainViewBodyState();
// }
//
// class _addCategoryMainViewBodyState extends State<addCategoryMainViewBody> {
//
//   File? _image;
//   final _picker = ImagePicker();
//   final TextEditingController _textController = TextEditingController();
//   bool _isLoading = false;
//   String? _response;
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _uploadImage() async {
//     if (_image == null) return;
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     // تحويل الصورة إلى base64
//     final bytes = _image!.readAsBytesSync();
//     final String base64Image = base64Encode(bytes);
//
//     // إعداد البيانات لإرسالها إلى الـ API
//     final String text = _textController.text;
//     final Map<String, dynamic> data = {
//       'image': base64Image,
//       'text': text,
//     };
//
//     // إرسال البيانات إلى الـ API
//     const String apiUrl = 'https://your-api-url.com/upload';
//     // final response = await http.post(
//     //   Uri.parse(apiUrl),
//     //   headers: {'Content-Type': 'application/json'},
//     //   body: jsonEncode(data),
//     // );
//
//     // setState(() {
//     //   _isLoading = false;
//     //   _response = response.statusCode == 200
//     //       ? 'Upload Successful!'
//     //       : 'Upload Failed: ${response.body}';
//     // });
//   }
//
//     @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CategoryCubit, CategoryState>(
//       listener: (context, state) {
//         if (state is AddCategorySuccess) {
//           // context.go('/all_product_view');
//           context.replace('/category_main_all_body');
//         }
//       },
//       builder: (context, state) {
//         // SubCategoryGetAllModel allSubCategory =
//         // context.read<SubCategoryCubit>().allSubCategory!;
//         return
//           Scaffold(
//           appBar: AppBar(
//             title: const Text('إضافة صنف '),
//           ),
//           body: SingleChildScrollView(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                 child: Form(
//                   key: context.read<CategoryCubit>().formkey,
//                   child: Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(15)),
//                     width: 400,
//                     child: Column(
//                       children: [
//                         if (_image != null)
//                       Image.memory(base64Decode(base64Encode( _image!.readAsBytes()))),
//
//                           // Image.file(_image!),
//                         const SizedBox(height: 16.0),
//                         TextField(
//                           controller: _textController,
//                           decoration: const InputDecoration(
//                             labelText: 'Enter text',
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         ElevatedButton(
//                           onPressed: _pickImage,
//                           child: const Text('Pick Image'),
//                         ),
//                         const SizedBox(height: 16.0),
//                         ElevatedButton(
//                           onPressed: (){
//                             context.read<CategoryCubit>().adddCategoryFunction(context);
//                           },
//                           // _uploadImage,
//                           child: _isLoading ? const CircularProgressIndicator() : const Text('Upload'),
//                         ),
//                         if (_response != null) ...[
//                           const SizedBox(height: 16.0),
//                           Text(_response!),
//                         ],
//                         // DottedBorder(
//                         //   borderType: BorderType.RRect,
//                         //   strokeWidth: 1,
//                         //   color: Colors.red.shade200,
//                         //   radius: const Radius.circular(15),
//                         //   child: Container(
//                         //     // clipBehavior: Clip.antiAlias,
//                         //     decoration: BoxDecoration(
//                         //       shape: BoxShape.circle,
//                         //       // borderRadius: BorderRadius.circular(15),
//                         //       color: Colors.grey.shade200,
//                         //     ),
//                         //     width: 300,
//                         //     height: 130,
//                         //     child: true
//                         //         // child: context.read<CategoryCubit>().imageProduct ==
//                         //         // null
//                         //         ? Container(
//                         //             decoration: BoxDecoration(
//                         //               borderRadius: BorderRadius.circular(15),
//                         //               color: Colors.grey.shade100,
//                         //             ),
//                         //             child: Stack(
//                         //               children: [
//                         //                 Positioned(
//                         //                   // bottom: 5,
//                         //                   // right: 5,
//                         //                   child: InkWell(
//                         //                     onTap: () {
//                         //                       // context
//                         //                       //     .read<CategoryCubit>()
//                         //                       //     .selectImage(context);
//                         //                     },
//                         //                     child: const Center(
//                         //                       child: Row(
//                         //                         mainAxisAlignment:
//                         //                             MainAxisAlignment.center,
//                         //                         crossAxisAlignment:
//                         //                             CrossAxisAlignment.center,
//                         //                         children: [
//                         //                           Icon(Icons
//                         //                               .add_photo_alternate_outlined),
//                         //                           SizedBox(
//                         //                             width: 5,
//                         //                           ),
//                         //                           Text('أضف صورة المنتج'),
//                         //                         ],
//                         //                       ),
//                         //                     ),
//                         //                   ),
//                         //                 ),
//                         //               ],
//                         //             ),
//                         //           )
//                         //         :
//                         //     Container(
//                         //             // clipBehavior: Clip.antiAlias,
//                         //             // child: Image.memory(
//                         //             // context
//                         //             //     .read<CategoryCubit>()
//                         //             //     .imageProduct!,
//                         //             // fit: BoxFit.cover,
//                         //             // ),
//                         //             ),
//                         //   ),
//                         // ),
//                         // const SizedBox(
//                         //   height: 20,
//                         // ),
//                         // TextFormField(
//                         //   controller:
//                         //       context.read<CategoryCubit>().nameController,
//                         //   keyboardType: TextInputType.name,
//                         //   decoration: const InputDecoration(
//                         //     label: Text('أدخل اسم الصنف'),
//                         //     hintText: 'اسم الصنف ',
//                         //     prefixIcon: Icon(Icons.shopping_basket),
//                         //     border: OutlineInputBorder(),
//                         //   ),
//                         //   validator: (value) {
//                         //     if (value == null || value.isEmpty) {
//                         //       return 'This Field is required';
//                         //     }
//                         //     return null;
//                         //   },
//                         //   onFieldSubmitted: (value) {
//                         //     print(value);
//                         //   },
//                         // ),
//                         // const SizedBox(
//                         //   height: 20,
//                         // ),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.center,
//                         //   children: [
//                         //     state is AddCategoryLoading
//                         //         ? const CircularProgressIndicator()
//                         //         : MaterialButton(
//                         //             onPressed: () {
//                         //               // context
//                         //               //     .read<CategoryCubit>()
//                         //               //     .formkey
//                         //               //     .currentState!
//                         //               //     .validate();
//                         //               // if (context
//                         //               //         .read<CategoryCubit>()
//                         //               //         .imageProduct ==
//                         //               //     null) {
//                         //               //   message(
//                         //               //       context, 'أدخل صورة المنتج أولا');
//                         //               // } else {
//                         //               //   context
//                         //               //       .read<CategoryCubit>()
//                         //               //       .addProduct(
//                         //               //         context,
//                         //               //       );
//                         //               // }
//                         //             },
//                         //             color: const Color.fromARGB(
//                         //                 255, 236, 245, 252),
//                         //             elevation: 5,
//                         //             child: const Text('حفظ '),
//                         //           ),
//                         //     const SizedBox(
//                         //       width: 20,
//                         //     ),
//                         //     MaterialButton(
//                         //       onPressed: () {
//                         //         // context.read<CategoryCubit>().clearForm();
//                         //       },
//                         //       color: const Color.fromARGB(255, 236, 245, 252),
//                         //       elevation: 5,
//                         //       child: const Text('حذف '),
//                         //     ),
//                         //   ],
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
//
//
//
//
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   File? _image;
// //   final _picker = ImagePicker();
// //   final TextEditingController _textController = TextEditingController();
// //   bool _isLoading = false;
// //   String? _response;
// //
// //   Future<void> _pickImage() async {
// //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       setState(() {
// //         _image = File(pickedFile.path);
// //       });
// //     }
// //   }
// //
// //   Future<void> _uploadImage() async {
// //     if (_image == null) return;
// //
// //     setState(() {
// //       _isLoading = true;
// //     });
// //
// //     // تحويل الصورة إلى base64
// //     final bytes = _image!.readAsBytesSync();
// //     final String base64Image = base64Encode(bytes);
// //
// //     // إعداد البيانات لإرسالها إلى الـ API
// //     final String text = _textController.text;
// //     final Map<String, dynamic> data = {
// //       'image': base64Image,
// //       'text': text,
// //     };
// //
// //     // إرسال البيانات إلى الـ API
// //     const String apiUrl = 'https://your-api-url.com/upload';
// //     final response = await http.post(
// //       Uri.parse(apiUrl),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode(data),
// //     );
// //
// //     setState(() {
// //       _isLoading = false;
// //       _response = response.statusCode == 200
// //           ? 'Upload Successful!'
// //           : 'Upload Failed: ${response.body}';
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Image Upload with Base64'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             if (_image != null)
// //               Image.file(_image!),
// //             const SizedBox(height: 16.0),
// //             TextField(
// //               controller: _textController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Enter text',
// //               ),
// //             ),
// //             const SizedBox(height: 16.0),
// //             ElevatedButton(
// //               onPressed: _pickImage,
// //               child: const Text('Pick Image'),
// //             ),
// //             const SizedBox(height: 16.0),
// //             ElevatedButton(
// //               onPressed: _uploadImage,
// //               child: _isLoading ? const CircularProgressIndicator() : const Text('Upload'),
// //             ),
// //             if (_response != null) ...[
// //               const SizedBox(height: 16.0),
// //               Text(_response!),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
