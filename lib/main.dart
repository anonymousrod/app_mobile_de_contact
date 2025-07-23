import 'package:flutter/material.dart';
import 'models/contact.dart';
import 'pages/form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carnet de Contacts',
      debugShowCheckedModeBanner: false,
      home: FormPage(contacts: contacts),
    );
  }
}
