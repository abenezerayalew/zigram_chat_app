// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class OnlineChecker extends StatefulWidget {
//   const OnlineChecker({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _OnlineCheckerState createState() => _OnlineCheckerState();
// }

// class _OnlineCheckerState extends State<OnlineChecker> {
//   bool isActive = false;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase
//     Firebase.initializeApp().then((_) {
//       // Retrieve user's active status from Firebase
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc('FCgvrkmAZyeBiMYZOZAVWK9wjlz2')
//           .get()
//           .then((snapshot) {
//         if (snapshot.exists) {
//           setState(() {
//             isActive = snapshot.data()!['isActive'] ?? false;
//             print(isActive);
//           });
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'User is ${isActive ? 'Active' : 'Inactive'}',
//             style: TextStyle(fontSize: 24),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               // Update user's active status in Firebase
//               FirebaseFirestore.instance
//                   .collection('users')
//                   .doc('FCgvrkmAZyeBiMYZOZAVWK9wjlz2')
//                   .update({'isActive': !isActive}).then((_) {
//                 setState(() {
//                   isActive = !isActive;
//                   print(isActive);
//                 });
//               });
//             },
//             child: Text(isActive ? 'Deactivate' : 'Activate'),
//           ),
//         ],
//       ),
//     );
//   }
// }
