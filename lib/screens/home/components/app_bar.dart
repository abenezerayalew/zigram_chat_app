import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../settings/setting.dart';
import 'menu_tabs.dart';

class AppBarZ extends StatelessWidget {
  const AppBarZ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            const EdgeInsets.only(top: 12.0, left: 0, right: 0, bottom: 0.0),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Zigram',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                //*----------------------------------
                DropdownButton(
                  underline: Container(),
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                  onChanged: (newValue) {
                    if (newValue == 'logout') {
                      FirebaseAuth.instance.signOut();
                    }
                    if (newValue == 'settings') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'logout',
                      child: Text('Logout'),
                    ),
                    DropdownMenuItem(
                      value: 'settings',
                      child: Text('Settings'),
                    ),
                  ],
                )
                //*----------------------------------------------
              ],
            ),
            const MenuTabs()
          ],
        ),
        // alignment: Alignment.topCenter,
      ),
    );
  }
}
