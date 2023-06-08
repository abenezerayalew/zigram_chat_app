import 'package:flutter/material.dart';
import '../../../main.dart';

class MySwitchTheme extends StatefulWidget {
  const MySwitchTheme({super.key});

  @override
  State<MySwitchTheme> createState() => _MySwitchThemeState();
}

class _MySwitchThemeState extends State<MySwitchTheme> {
  bool light0 = true;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.mode_night_outlined,
          color: Colors.black,
        );
      }
      return const Icon(
        Icons.light_mode_outlined,
        color: Color(0xFF9CEBBD),
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: Colors.black,
      inactiveTrackColor: const Color(0xFF9CEBBD),
      thumbColor: MaterialStateProperty.all(Colors.grey),

      // activeThumbImage: const AssetImage('assets/images/66.png'),
      thumbIcon: thumbIcon,
      value: light0,
      onChanged: (bool value) {
        setState(() {
          light0 = value;
          MyApp.themeNotifier.value =
              MyApp.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
        });
      },
    );
  }
}
