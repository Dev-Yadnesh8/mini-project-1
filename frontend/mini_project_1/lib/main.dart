import 'package:flutter/material.dart';
import 'package:mini_project_1/features/auth/view/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mini Project 1',
    
      home: SignInScreen()
    );
  }
}
