import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool messageNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'),
                  fit: BoxFit.cover,
                ),
              ), // Replace with your desired background image or user profile picture
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: BackButton(
                  //       onPressed: () {
                  //         Navigator.pop(context);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Jhon Doe',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 10),
                        child: Text(
                          'last seen recently',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                    child: FloatingActionButton(
                      shape: ShapeBorder.lerp(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        0,
                      ),
                      onPressed: () {
                        // Add your desired action for the floating button here
                      },
                      child: Icon(Icons.message),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Info',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Mobile Number: +25134567890',
                        style: TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          const Text(
                            'Send Message ',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(width: 8.0),
                          Switch(
                            value: messageNotification,
                            onChanged: (value) {
                              setState(() {
                                messageNotification = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white, width: 0.1),
                          ),
                        ),
                        child: const Text(
                          'Send Message ',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        width: double.infinity,
                        child: const Text(
                          'Report User',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
