import 'package:flutter/material.dart';

class ViewContactPage extends StatelessWidget {
  const ViewContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Name'),
      ),
      body: Column(
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
            title: Text('Message'),
            subtitle: Text('Send a message'),
            onTap: () {
              // Perform action to send a message to the contact
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Call'),
            subtitle: Text('Call the contact'),
            onTap: () {
              // Perform action to call the contact
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Video Call'),
            subtitle: Text('Make a video call'),
            onTap: () {
              // Perform action to make a video call to the contact
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text('Add to Favorites'),
            onTap: () {
              // Perform action to add contact to favorites
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Contact'),
            onTap: () {
              // Perform action to delete the contact
            },
          ),
        ],
      ),
    );
  }
}
