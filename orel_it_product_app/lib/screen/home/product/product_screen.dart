import 'package:flutter/material.dart';
import 'package:ui_design_quotes/theme/base_color.dart';
import 'package:ui_design_quotes/widget/appbar/default.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppbar(
      backgroundColor: appWhite,
      textColor: appBlack,
    ));
  }
}
