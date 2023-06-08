// import 'package:flutter/material.dart';

// import 'favorite_card.dart';

// class FavoriteList extends StatelessWidget {
//   const FavoriteList({super.key});

//   @override
//   Widget build(BuildContext context) {
// return Padding(
//   padding: const EdgeInsets.only(top: 30.0),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Padding(
//         padding: EdgeInsets.only(left: 20.0),
//         child: Text(
//           'Favorite Contacts',
//           style: TextStyle(
//             fontSize: 21,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//           Container(
//             color: Colors.red,
// height: 120,
// width: double.infinity,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder: (BuildContext context, contact) {
//                   return Row(
//                     children: const [
//                       FavoriteCard(
//                         image: 'assets/images/1.jpg',
//                         name: 'ali',
//                       ),
// FavoriteCard(
//   image: 'assets/images/2.jpg',
//   name: 'jhon',
// ),
//                       FavoriteCard(
//                         image: 'assets/images/3.jpg',
//                         name: 'tom',
//                       ),
//                     ],
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants.dart';
import '../recent/recent_card.dart';
import 'favorite_card.dart';

final Timestamp time = Timestamp.now();

// MessageBubble messageBubble = MessageBubble();
class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});
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
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final chatdocs = userSnapshot.data!.docs;
                return Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Favorite Contacts',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: kDefaultPadding),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: chatdocs.length,
                            itemBuilder: (context, index) => Row(
                              children: [
                                FavoriteCard(
                                  image: chatdocs[index]['image_url'],
                                  name: chatdocs[index]['username'],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
