import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'auth_service.dart';
import '../home/home_page.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _register(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    var user = await AuthService().registerWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('إنشاء الحساب فشل')),
      );
    }
  }

  void _sendToWhatsApp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String phone = phoneController.text;

    String message =
        "الاسم: $name\nالبريد الإلكتروني: $email\nكلمة المرور: $password\nرقم الهاتف: $phone";

    String url = "https://wa.me/رقمك?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء حساب جديد'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'الاسم'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'رقم الهاتف'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _register(context);
                _sendToWhatsApp();
              },
              child: Text('إنشاء حساب'),
            ),
          ],
        ),
      ),
    );
  }
}