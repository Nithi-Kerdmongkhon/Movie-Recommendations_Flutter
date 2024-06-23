import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/main_screen.dart';
import 'package:project/screens/registry_screen.dart';
import 'package:project/screens/sign_in_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color.fromARGB(255, 23, 21, 21)),
        initialRoute: MainScreen.id,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          MainScreen.id: (context) => const MainScreen(),
          RegistryScreen.id: (context) => const RegistryScreen(),
          SignInScreen.id: (context) => const SignInScreen(),
        });
  }
}
