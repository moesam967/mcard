import 'package:flutter/material.dart';

import '../management/balance_management_page.dart';
import '../management/orders_management_page.dart';
import '../management/services_management_page.dart';
import '../management/users_management_pag.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لوحة التحكم'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            _buildCard(context, 'إدارة المستخدمين', Icons.people, Colors.blue, UsersManagementPage()),
            _buildCard(context, 'إدارة الطلبات', Icons.shopping_cart, Colors.green, OrdersManagementPage()),
            _buildCard(context, 'إدارة الخدمات', Icons.build, Colors.red, ServicesManagementPage()),
            _buildCard(context, 'إدارة الرصيد', Icons.account_balance_wallet, Colors.purple, BalanceManagementPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50, color: color),
            SizedBox(height: 20),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}