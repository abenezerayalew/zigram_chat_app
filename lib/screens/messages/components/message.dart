import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});
  Future<User?> _getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
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
              // if (snapshot.hasError) {
              //   return const Text('Something went wrong');
              // }

              if (chatsnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final chatdocs = chatsnapshot.data!.docs;

              return Expanded(
                child: ListView.builder(
                    reverse: true,
                    itemCount: chatdocs.length,
                    itemBuilder: (context, index) {
                      return MessageBubble(
                        // username: chatdocs[index]['username'], +
                        userImage: chatdocs[index]['userImage'],
                        time: chatdocs[index]['createdAt'],
                        message: chatdocs[index]['text'],
                        isMe: chatdocs[index]['userId'] ==
                            futureSnapshot.data!.uid,
                        key: ValueKey(chatdocs[index].id),
                      );
                    }),
              );
            },
          );
          // }
        });
    // 2
  }
}
