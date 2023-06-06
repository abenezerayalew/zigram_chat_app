import 'package:flutter/material.dart';

class ContactRecent extends StatelessWidget {
  const ContactRecent({super.key, required this.image, required this.name});
  final String image;
  final String name;
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image.toString()),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(children: [
            Text(name.toUpperCase()),
            const Text('Hello'),
          ]),
          const Spacer(),
          const Text('12:00'),
        ],
      ),
    );
  }
}
