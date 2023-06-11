import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_design_quotes/theme/base_color.dart';
import 'package:ui_design_quotes/widget/appbar/default.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController controller = TextEditingController();
  // String? _currentAddress;
  // _getCurrentAddress() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _currentAddress = prefs.getString('currentLocation') ?? '';
  // }

  @override
  void initState() {
    // _getCurrentAddress();
    super.initState();
  }

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
          // HomeScreen Menu Photo
          Padding(
            padding: const EdgeInsets.only(right: 24, left: 24),
            child: Material(
              child: Container(
                padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // color: Colors.red,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/menu.png'),
                      fit: BoxFit.fill),
                ),
                height: 270,
                width: 400,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Welcome',
                                  style: TextStyle(
                                      color: appBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0)),
                              SizedBox(
                                height: 2,
                              ),
                              Text('John',
                                  style: TextStyle(
                                      color: appBlack,
                                      fontSize: 14,
                                      letterSpacing: 1.0)),
                            ],
                          ),
                          //
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
