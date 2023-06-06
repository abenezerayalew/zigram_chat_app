import 'package:flutter/material.dart';

import '../components/favorite/favorite_list_card.dart';
import '../components/recent/recent_list_card.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  static String id = 'home_screen';
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        FavoriteList(),
        RecentList(),
      ],
    );
  }
}
