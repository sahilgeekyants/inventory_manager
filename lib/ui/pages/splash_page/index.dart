import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String welcomeText = 'Welcome to Inventory Manager';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(welcomeText),
      ),
    );
  }
}
