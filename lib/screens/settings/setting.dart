import 'package:flutter/material.dart';

import 'components/profile.dart';
import 'components/switch_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          const MySwitchTheme(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Account'),
            onTap: () {
              // Navigate to the account settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () {
              // Navigate to the chat settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Navigate to the notification settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy'),
            onTap: () {
              // Navigate to the privacy settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.data_usage),
            title: Text('Data and Storage Usage'),
            onTap: () {
              // Navigate to the data and storage settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              // Navigate to the help page
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {
              // Perform log out action
            },
          ),
        ],
      ),
    );
  }
}
