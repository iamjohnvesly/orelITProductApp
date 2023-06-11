import 'package:flutter/material.dart';

import 'location/location_screen.dart';

class HomeScreen extends StatelessWidget {
  final String refreshToken;
  const HomeScreen({Key? key, required this.refreshToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: LocationPage())),
    );
  }
}
