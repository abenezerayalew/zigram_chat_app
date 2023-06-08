import 'package:flutter/material.dart';

import '../pages/contacts/contact_screen.dart';
import '../pages/messages/message_screen.dart';
import '../pages/online/online_screen.dart';
import '../pages/nearby/people_nearby.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 170),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30.0))),
            child: TabBarView(
              children: [
                ///******************** 1^St Tab ****************************************************/
                MessageScreen(),

                ///********************** 2^St Tab *************************************************/

                PeopleNearbyScreen(),

                ///******************** 3^rd Tab ****************************************************/

                OnlineScreen(),

                ///********************** 4^th Tab *************************************************/

                ContactPage()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
