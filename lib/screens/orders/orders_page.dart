import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبات'),
      ),
      body: Center(
        child: Text('حالة الطلبات'),
      ),
    );
  }
}