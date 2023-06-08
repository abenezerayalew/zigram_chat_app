import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 64.0,
                    // Replace with contact image
                    backgroundImage: AssetImage('assets/contact_image.png'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                  subtitle: Text('Contact Phone Number'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Send Message'),
                  onTap: () {
                    // Perform action to send a message to the contact
                  },
                ),
                ListTile(
                  leading: Icon(Icons.star_border),
                  title: Text('Add to Favorites'),
                  onTap: () {
                    // Perform action to add contact to favorites
                  },
                ),
                ListTile(
                  leading: Icon(Icons.block),
                  title: Text('Block'),
                  onTap: () {
                    // Perform action to block the contact
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete Contact'),
                  onTap: () {
                    // Perform action to delete the contact
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            child: Text('Share Contact'),
            onPressed: () {
              // Perform action to share the contact
            },
          ),
        ),
      ],
    );
  }
}
