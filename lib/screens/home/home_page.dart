import 'package:flutter/material.dart';
import '../management/services_management_page.dart';
import '../settings/settings_page.dart';
import '../orders/orders_page.dart';
import 'custom_card.dart';
import 'subscriptions_page.dart';
import 'offers_page.dart';
import 'virtual_numbers_page.dart';
import 'social_media_page.dart';
import 'games_page.dart';
import '../../widgets/custom_card.dart';
import 'dashboard_page.dart';  // استيراد لوحة التحكم

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),  // الصفحة الرئيسية الحالية
    OrdersPage(),  // صفحة الطلبات
    SettingsPage(),  // صفحة الإعدادات
    DashboardPage(),  // إضافة لوحة التحكم كخيار
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCard'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'رصيدك: \$100', // Placeholder for balance
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'الطلبات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الإعدادات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'لوحة التحكم',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            CustomCard(title: 'إدارة الخدمات', icon: Icons.build, page: ServicesManagementPage()),
            CustomCard(title: 'الاشتراكات', icon: Icons.subscriptions, page: SubscriptionsPage()),
            CustomCard(title: 'العروض', icon: Icons.local_offer, page: OffersPage()),
            CustomCard(title: 'الأرقام الوهمية', icon: Icons.phone, page: VirtualNumbersPage()),
            CustomCard(title: 'السوشال ميديا', icon: Icons.people, page: SocialMediaPage()),
            CustomCard(title: 'الألعاب', icon: Icons.videogame_asset, page: GamesPage()),
          ],
        ),
      ),
    );
  }
}