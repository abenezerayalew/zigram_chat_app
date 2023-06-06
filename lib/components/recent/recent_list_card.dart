import 'package:flutter/material.dart';
import 'package:zigram_chat_app/screens/messages/components/message_bubble.dart';

import 'recent_card.dart';

// MessageBubble messageBubble = MessageBubble();
class RecentList extends StatelessWidget {
  const RecentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: const BoxDecoration(
            color: Color(0XFF090C22),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Recent Chats',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ContactRecent(
                      image: 'assets/images/1.jpg',
                      name: 'ali',
                    ),
                    ContactRecent(
                      image: 'assets/images/2.jpg',
                      name: 'jhon',
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
