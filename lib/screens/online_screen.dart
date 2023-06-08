import 'package:flutter/material.dart';

import '../components/favorite/favorite_list_card.dart';
import '../components/recent/recent_list_card.dart';
import 'user_online.dart';

class OnlineScreen extends StatefulWidget {
  const OnlineScreen({super.key});

  static String id = 'home_screen';
  @override
  State<OnlineScreen> createState() => _OnlineScreenState();
}

class _OnlineScreenState extends State<OnlineScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/images/ola.gif',
            width: 150,
            height: 150,
          ),
        ),
        const Text(
          'Online Now',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            'chat with your friends and family',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const RecentList()
        // const OnlineChecker()
      ],
    );
  }
}
