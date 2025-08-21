import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(const WareefApp());

class WareefApp extends StatelessWidget {
  const WareefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أكاديمية وريف',
      theme: ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'Cairo'),
      home: const WelcomeScreen(),
    );
  }
}
