import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactListPage extends StatefulWidget {
  final List<Contact> contacts;

  const ContactListPage({Key? key, required this.contacts}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  void _supprimerContact(int index) {
    setState(() {
      widget.contacts.removeAt(index);
    });
  }

  void _modifierContact(int index) {
    final contact = widget.contacts[index];
    final nomController = TextEditingController(text: contact.nom);
    final prenomsController = TextEditingController(text: contact.prenoms);
    final telephoneController = TextEditingController(text: contact.telephone);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Color(0xFFf1f8e9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('✏️ Modifier le contact',
            style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: prenomsController,
                decoration: InputDecoration(
                  labelText: 'Prénoms',
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: telephoneController,
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                contact.nom = nomController.text;
                contact.prenoms = prenomsController.text;
                contact.telephone = telephoneController.text;
              });
              Navigator.pop(context);
            },
            child: Text(' Enregistrer', style: TextStyle(color: Colors.green.shade800)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Annuler'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xFF556B2F),
        title: Text(' Mes contacts '),
      ),
      body: widget.contacts.isEmpty
          ? Center(
              child: Text(
                'Pas de contact pour le moment.',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: widget.contacts.length,
              itemBuilder: (context, index) {
                final contact = widget.contacts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  elevation: 6,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFdcedc8),
                      child: Icon(Icons.person_outline, color: Color(0xFF556B2F)),
                    ),
                    title: Text('${contact.nom} ${contact.prenoms}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('📞 ${contact.telephone}'),
                    trailing: Wrap(
                      spacing: 10,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.orange.shade700),
                          onPressed: () => _modifierContact(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red.shade400),
                          onPressed: () => _supprimerContact(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
