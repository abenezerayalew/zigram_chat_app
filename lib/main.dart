import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zigram_chat_app/screens/auth/mobile/main_phone_verification_page.dart';
import 'package:zigram_chat_app/screens/home/home_screen.dart';
import 'firebase_options.dart';
import 'screens/auth/email/auth_screen.dart';
import 'screens/messages/message_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.dark);
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
              theme: ThemeData(
                useMaterial3: true,
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(color: Colors.black),
                  bodyMedium: TextStyle(color: Colors.black),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                appBarTheme:
                    const AppBarTheme(backgroundColor: Color(0XFF00BF6D)),
                scaffoldBackgroundColor: Colors.white,
                colorScheme: const ColorScheme.light().copyWith(
                  brightness: Brightness.light,
                  primaryContainer: Colors.grey.shade300,
                  surface: Colors.grey.shade400,
                  onSurface: Colors.white,
                  secondaryContainer: Colors.grey.shade200,
                ),
              ),
              darkTheme: ThemeData.dark().copyWith(
                  useMaterial3: true,
                  appBarTheme:
                      const AppBarTheme(backgroundColor: Color(0XFF090C22)),
                  scaffoldBackgroundColor: const Color(0XFF090C22),
                  colorScheme: const ColorScheme.dark().copyWith(
                    brightness: Brightness.dark,
                    surface: const Color(0xFF4C4F5E),
                    primaryContainer: const Color(0XFF00BF6D),
                    secondaryContainer: const Color(0XFF101427),
                  )),
              themeMode: currentMode,
              initialRoute: AuthPhone.id,
              // initialRoute: HomeScreen.id,
              // routes: {
              //   HomeScreen.id: (context) => const HomeScreen(),
              //   AuthPhone.id: (context) => const AuthPhone(),
              //   MessagesScreens.id: (context) => const MessagesScreens(),
              // });
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasData) {
                    return const HomeScreen();
                    // return const MessagesScreens();
                  }
                  return const AuthScreen();
                },
              ));
        });
  }
}
