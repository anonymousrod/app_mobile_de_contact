import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'contact_list_page.dart';

class FormPage extends StatefulWidget {
  final List<Contact> contacts;

  const FormPage({Key? key, required this.contacts}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _nom = '';
  String _prenoms = '';
  String _telephone = '';

  void _ajouterContact() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        widget.contacts.add(
          Contact(nom: _nom, prenoms: _prenoms, telephone: _telephone),
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' Contact ajouté !'),
          backgroundColor: Colors.green.shade700,
        ),
      );
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 194, 90),
        title: Text('Formulaire pour ajout de contact'),
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.list_alt_outlined),
            tooltip: "Voir les contacts",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ContactListPage(contacts: widget.contacts),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 8,
          color: Color(0xFFdcedc8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) => value!.isEmpty ? 'Entrez un nom svp' : null,
                    onSaved: (value) => _nom = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Prénoms',
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) => value!.isEmpty ? 'Entrez les prénoms svp ' : null,
                    onSaved: (value) => _prenoms = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Téléphone',
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) =>
                        value!.length < 10 ? 'Numéro invalide, Ajoutez 01 svp' : null,
                    onSaved: (value) => _telephone = value!,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _ajouterContact,
                    icon: Icon(Icons.save_alt_rounded),
                    label: Text('Ajoutez au contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 198, 228, 147),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
