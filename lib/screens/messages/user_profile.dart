import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

final Timestamp time = Timestamp.now();

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
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
    CollectionReference users = FirebaseFirestore.instance.collection('users');

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
              // if (snapshot.hasError) {
              //   return const Text('Something went wrong');
              // }

              if (chatsnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final chatdocs = chatsnapshot.data!.docs;

              return Row(
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(chatdocs[0]['userImage']),
                  ),
                  const SizedBox(width: kDefaultPadding * 0.75),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatdocs[0]['username'],
                        // "Kristin Watson",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        formatTimestamp(time.toDate()),

                        // "Active 3m ago",
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              );
              //  Expanded(
              //   child: ListView.builder(
              //       reverse: true,
              //       itemCount: chatdocs.length,
              //       itemBuilder: (context, index) {
              //         return MessageBubble(
              //           username: chatdocs[index]['username'],
              //           userImage: chatdocs[index]['userImage'],
              //           time: chatdocs[index]['createdAt'],
              //           message: chatdocs[index]['text'],
              //           isMe: chatdocs[index]['userId'] ==
              //               futureSnapshot.data!.uid,
              //           key: ValueKey(chatdocs[index].id),
              //         );
              //       }),
              // );
            },
          );
          // }
        });
  }
}
