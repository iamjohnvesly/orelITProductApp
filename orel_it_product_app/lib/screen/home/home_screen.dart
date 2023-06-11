import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String refreshToken;
  const HomeScreen({Key? key, required this.refreshToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text(refreshToken))),
    );
  }
}
