import 'package:flutter/material.dart';

class VirtualNumbersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأرقام الوهمية'),
      ),
      body: Center(
        child: Text('عرض الأرقام الوهمية المتاحة'),
      ),
    );
  }
}