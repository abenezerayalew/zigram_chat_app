import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = 'John Doe'; //
    _statusController.text = 'Hey there! I am using ZigramApp.'; //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 64.0,
              //  with user profile image
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(
                labelText: 'Status',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                // Perform save action
                String name = _nameController.text;
                String status = _statusController.text;
                // Save the updated profile information
                print('Name: $name, Status: $status');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
