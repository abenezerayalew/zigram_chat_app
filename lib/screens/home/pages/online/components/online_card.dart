import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../constants.dart';

class OnlineCard extends StatelessWidget {
  const OnlineCard(
      {super.key,
      required this.image,
      required this.name,
      required this.message});
  final String image;
  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.1),
        ),
        // color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      // color: Color(0XFF00BF6D),
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.only(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MessagesScreens();
          }));
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(image),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(children: [
                Text(name.toUpperCase()),
                Container(
                  width: 70,
                  child: Text(
                    message,
                    // textAlign: TextAlign.start,
                    maxLines: 1, // Limit the text to a single line
                    overflow: TextOverflow
                        .visible, // Show '...' at the end if the text overflows
                    style: TextStyle(fontSize: 12),
                    // softWrap: true,
                    textScaleFactor: 1.0,
                  ),
                ),
              ]),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
