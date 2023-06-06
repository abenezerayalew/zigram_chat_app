import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zigram_chat_app/screens/messages/user_profile.dart';
import '/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreens extends StatelessWidget {
  const MessagesScreens({Key? key}) : super(key: key);
  static String id = "messages_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const UserProfile(),
      actions: [
        //*----------------------------------
        DropdownButton(
          underline: Container(),
          icon: const Icon(
            Icons.more_vert,
          ),
          onChanged: (newValue) {
            if (newValue == 'logout') {
              FirebaseAuth.instance.signOut();
            }
            if (newValue == 'ViewContactPage') {}
            // ViewContactPage
          },
          items: const [
            DropdownMenuItem(
              value: 'logoutPage',
              child: Text('Logout'),
            ),
            DropdownMenuItem(
              value: 'ViewContactPage',
              child: Text('ViewContact'),
            ),
          ],
        )
        //*----------------------------------------------
      ],
    );
  }
}
