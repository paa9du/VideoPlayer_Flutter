import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_player/homeScreen.dart';
import 'package:video_player/login_page.dart';
import 'package:video_player/register_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); // Required for Firebase
  // await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homeScreen', // Set the initial route to 'login'
      routes: {
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'homeScreen': (context) => HomeScreen(),
      },
    );
  }
}
