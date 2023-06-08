import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zigram_chat_app/screens/home/pages/nearby/components/people_list.dart';

import '../../../../../screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../constants.dart';

import '../messages/components/favorite/favorite_list_card.dart';
import '../messages/components/recent/recent_list_card.dart';

class PeopleNearbyScreen extends StatefulWidget {
  const PeopleNearbyScreen({super.key});

  static String id = 'home_screen';
  @override
  State<PeopleNearbyScreen> createState() => _PeopleNearbyScreenState();
}

class _PeopleNearbyScreenState extends State<PeopleNearbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/images/loca.gif',
            width: 150,
            height: 150,
          ),
        ),
        const Text(
          'People Nearby',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            'Connect, exchange contacts, forge friendships nearby.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const PeopleList()
      ],
    );
  }
}
