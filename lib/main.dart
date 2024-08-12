import 'package:flutter/material.dart';
import 'package:post_api/screens/Register/login_screen.dart';
import 'package:post_api/screens/job/my_job_home.dart';
import 'package:post_api/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.red,foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.white)
        ),
      ),
      home: const RegisterScreen(),
    );
  }
}

