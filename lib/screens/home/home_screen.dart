import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../auth/email/auth_screen.dart';
import '../messages/message_screen.dart';
import 'components/app_bar.dart';
import 'components/menu_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Container(
            color: Colors.black,
            child: Stack(children: [
              Positioned.fill(
                  child: Opacity(
                opacity: 0.3,
                child: Image.asset('assets/images/back.jpg', fit: BoxFit.cover),
              )),
              /***_ Appbar + MenuTab_****/
              const AppBarZ(),
              /***_ MenuContent _****/
              const MenuContent()
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MessagesScreens();
              }));
            },
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ));
  }
}
