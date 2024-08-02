import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart'; // لتحديد إذا كنا نعمل على الويب
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';

class AddSubCategoryView extends StatefulWidget {
  AddSubCategoryView({super.key, required this.categoryId});
  String categoryId;
  @override
  State<AddSubCategoryView> createState() => _AddSubCategoryViewState();
}

class _AddSubCategoryViewState extends State<AddSubCategoryView> {
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
        'title2': title,
        'image2': base64Image,
        'category_id': widget.categoryId
        // widget.categoryId,
      };
      print('the category id is : ${widget.categoryId}');
      const String username = '11184828';
      const String password = '60-dayfreetrial';
      // التأكد من أن البيانات التي نرسلها صحيحة
      print('Data being sent to the API: $data');

      // إرسال البيانات إلى الـ API
      const String apiUrl =
          'http://yomnabaksmawi-001-site1.ltempurl.com/api/subcategory/add';
      final response = await http.post(
        Uri.parse(apiUrl),
        // headers: {'Content-Type': 'application/json'},
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$username:$password')),
        },
        body: jsonEncode(data),
      );

      setState(() {
        _isLoading = false;
        _response = response.statusCode == 200
            ? 'Upload Successful!'
            : 'Upload Failed: ${response.body}';
      });

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
        if (state is AddSubCategorySuccess) {
          context.replace('/category_main_all_body');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(' إضافة صنف فرعي'),
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
                            labelText: 'ادخل اسم الصنف الفرعي',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _pickImage,
                          child: const Text('ارفع صورة'),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            _uploadImage();
                          },
                          child: _isLoading
                              ? const CircularProgressIndicator()
                              : const Text('حفظ'),
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
