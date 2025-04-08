import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الألعاب'),
      ),
      body: Center(
        child: Text('عرض الألعاب المتاحة'),
      ),
    );
  }
}