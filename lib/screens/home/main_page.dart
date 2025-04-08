import 'package:flutter/material.dart';
import 'services_page.dart';
import 'subscriptions_page.dart';
import 'offers_page.dart';
import 'virtual_numbers_page.dart';
import 'social_media_page.dart';
import 'games_page.dart';

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
            _buildCard(context, 'الخدمات', Icons.build, ServicesPage()), // تأكد من تعريف الأيقونات بشكل صحيح
            _buildCard(context, 'الاشتراكات', Icons.subscriptions, SubscriptionsPage()),
            _buildCard(context, 'العروض', Icons.local_offer, OffersPage()),
            _buildCard(context, 'الأرقام الوهمية', Icons.phone, VirtualNumbersPage()),
            _buildCard(context, 'السوشال ميديا', Icons.people, SocialMediaPage()),
            _buildCard(context, 'الألعاب', Icons.videogame_asset, GamesPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Widget page) {
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
            Icon(icon, size: 50),
            SizedBox(height: 20),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}