import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.time,
    required this.userImage,
    // required this.username
  });
  final String userImage;
  final String message;
  final Timestamp time;
  final bool isMe;
  // final String username;
  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference < Duration(minutes: 1)) {
      return 'Just now';
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
    return Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(userImage)),
          Container(
            decoration: BoxDecoration(
                color: isMe ? Colors.grey.shade800 : Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: !isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                    bottomRight: !isMe
                        ? const Radius.circular(12)
                        : const Radius.circular(0))),
            // bottomRight: Radius.circular
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            width: 140,
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                //**********Username**********
                // Text(
                //   username,
                //   style: TextStyle(
                //     color: isMe ? Colors.green : Colors.white,
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                //**********Message**********
                Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.green : Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                ),
                Text(
                  formatTimestamp(time.toDate()),
                  style: TextStyle(
                    color: isMe ? Colors.green : Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                ),
              ],
            ),
          ),
        ]);
  }
}
