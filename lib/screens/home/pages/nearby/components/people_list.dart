import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../constants.dart';
import 'pepople_card.dart';

final Timestamp time = Timestamp.now();

// MessageBubble messageBubble = MessageBubble();
class PeopleList extends StatelessWidget {
  const PeopleList({super.key});
  Future<User?> _getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference < Duration(minutes: 1)) {
      return 'Just now';
    } else if (difference == Duration(hours: 1)) {
      final minutes = difference.inMinutes;
      return ' Online';
    } else if (difference < Duration(hours: 1)) {
      final minutes = difference.inMinutes;
      return '$minutes minutes ago';
    } else {
      final hours = difference.inHours;
      return '$hours hours ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
        future: _getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<User?> futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> chatsnapshot) {
                if (chatsnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final chatdocs = chatsnapshot.data!.docs;
                return Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0XFF090C22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding),
                    child: ListView.builder(
                        itemCount: chatdocs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PeopleCard(
                                  image: chatdocs[index]['userImage'],
                                  name: chatdocs[index]['username'],
                                  message: '${index}00 m away'),
                            ],
                          );
                        }),
                  ),
                ));
              });
        });
  }
}
