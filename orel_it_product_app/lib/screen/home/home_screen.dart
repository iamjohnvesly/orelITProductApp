import 'package:flutter/material.dart';
import 'package:ui_design_quotes/screen/home/product/product_screen.dart';

class HomeScreen extends StatelessWidget {
  final String refreshToken;
  const HomeScreen({Key? key, required this.refreshToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: ProductScreen())),
    );
  }
}
