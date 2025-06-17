import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/ordersscreen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Orders Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
