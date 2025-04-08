import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة الخدمات'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('services').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return ListTile(
                title: Text(doc['service_name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('السعر: \$${doc['price']}'),
                    Text('القسم: ${doc['category']}'),
                    Text('الوصف: ${doc['description']}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editService(context, doc);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        FirebaseFirestore.instance.collection('services').doc(doc.id).delete();
                      },
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addService(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addService(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('إضافة خدمة جديدة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'اسم الخدمة'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'السعر'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'القسم'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'الوصف'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('services').add({
                  'service_name': nameController.text,
                  'price': double.parse(priceController.text),
                  'category': categoryController.text,
                  'description': descriptionController.text,
                });
                Navigator.of(context).pop();
              },
              child: Text('إضافة'),
            ),
          ],
        );
      },
    );
  }

  void _editService(BuildContext context, DocumentSnapshot doc) {
    TextEditingController nameController = TextEditingController(text: doc['service_name']);
    TextEditingController priceController = TextEditingController(text: doc['price'].toString());
    TextEditingController categoryController = TextEditingController(text: doc['category']);
    TextEditingController descriptionController = TextEditingController(text: doc['description']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('تعديل الخدمة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'اسم الخدمة'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'السعر'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'القسم'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'الوصف'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('services').doc(doc.id).update({
                  'service_name': nameController.text,
                  'price': double.parse(priceController.text),
                  'category': categoryController.text,
                  'description': descriptionController.text,
                });
                Navigator.of(context).pop();
              },
              child: Text('تعديل'),
            ),
          ],
        );
      },
    );
  }
}