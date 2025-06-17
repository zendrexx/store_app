import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  static const String routeName = '/vendorsscreen';
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Vendor Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
