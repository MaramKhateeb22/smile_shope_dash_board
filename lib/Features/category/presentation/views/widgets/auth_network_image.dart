import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageWithAuth extends StatefulWidget {
  final String imageUrl;
  final String username;
  final String password;

  const ImageWithAuth(
      {super.key,
      required this.imageUrl,
      required this.username,
      required this.password});

  @override
  _ImageWithAuthState createState() => _ImageWithAuthState();
}

class _ImageWithAuthState extends State<ImageWithAuth> {
  late Future<Uint8List> _imageData;

  @override
  void initState() {
    super.initState();
    _imageData = fetchImage(widget.imageUrl, widget.username, widget.password);
  }

  Future<Uint8List> fetchImage(
      String url, String username, String password) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      },
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _imageData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(
            child: Image.memory(
              snapshot.data!,
              fit: BoxFit.cover,
              // color: Colors.amber,
            ),
          );
        }
      },
    );
  }
}
