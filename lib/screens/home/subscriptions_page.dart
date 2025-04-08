import 'package:flutter/material.dart';

class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاشتراكات'),
      ),
      body: Center(
        child: Text('عرض الاشتراكات المتاحة'),
      ),
    );
  }
}