import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final List<String> contacts = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Williams',
    'Emily Brown',
    'Michael Davis',
    'Sarah Wilson',
    'David Thompson',
    'Olivia Lee',
    'Daniel Martinez',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Handle invite friends button press
              },
              child: Text('Invite Friends'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(contacts[index][0]),
                  ),
                  title: Text(contacts[index]),
                  subtitle: Text('Online'),
                  onTap: () {
                    // Handle contact tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
