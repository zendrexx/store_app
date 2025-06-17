import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = '/productsscreen';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Products Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
