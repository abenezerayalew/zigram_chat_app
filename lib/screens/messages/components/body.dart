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
      child: Column(
        children: const [
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
          MessageStream(),
          ChatInputField(),
        ],
      ),
    );
  }
}
