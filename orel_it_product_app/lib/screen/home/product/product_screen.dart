import 'package:flutter/material.dart';
import 'package:ui_design_quotes/theme/base_color.dart';
import 'package:ui_design_quotes/widget/appbar/default.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        backgroundColor: appWhite,
        textColor: appBlack,
      ),
      body: Column(
        children: [
          // serach bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appGrey,
              ),
              child: Row(children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.search),
                ),
                SizedBox(width: 10),
                Text(
                  'Search for items',
                  style: TextStyle(color: appBlack),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
