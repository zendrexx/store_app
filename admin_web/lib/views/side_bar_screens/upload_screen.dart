import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  static const String routeName = '/uploadscreen';
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Upload Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
