import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageTextController = TextEditingController();

  var _enteredMessage = '';
  void _sendMessage() async {
    messageTextController.clear();
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      // 'userId': FirebaseAuth.instance.currentUser!.uid, //+++++++
      'text': _enteredMessage,
      'createdAt': Timestamp.now(), //+++++++
      'userId': user.uid,
      'username': userData['username'],
      'userImage': userData['image_url'],
    });
    _enteredMessage = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          const SizedBox(width: kDefaultPadding),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.75,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.64),
                  ),
                  const SizedBox(width: kDefaultPadding / 4),
                  Expanded(
                    child: TextField(
                      autocorrect: true,
                      enableSuggestions: true,
                      controller: messageTextController,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        setState(() {
                          _enteredMessage = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Type message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding / 4),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_outlined),
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.64),
                  ),
                  // IconButton(
                  //   onPressed:
                  //       _enteredMessage.trim().isEmpty ? null : _sendMessage,
                  //   icon: const Icon(Icons.send),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(width: kDefaultPadding / 2),
          FloatingActionButton.small(
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              0,
            ),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            child: Icon(
              Icons.send,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
    );
  }
}
