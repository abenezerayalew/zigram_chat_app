import '/constants.dart';
import '/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            opacity: 0.3,
            child: Image.asset('assets/images/back.jpg', fit: BoxFit.cover),
          )),
          // child: Column(
          //   children: const [
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //     child: ListView.builder(
          //       itemCount: demeChatMessages.length,
          //       itemBuilder: (context, index) =>
          //           Message(message: demeChatMessages[index]),
          //     ),
          //   ),
          // ),
          Column(children: const [
            MessageStream(),
            ChatInputField(),
          ])
        ],
      ),
    ));
  }
}
