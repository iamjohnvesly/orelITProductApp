import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_design_quotes/theme/base_color.dart';
import 'package:ui_design_quotes/widget/appbar/default.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../api/api_client.dart';
import '../../../model/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController controller = TextEditingController();
  final ApiClient apiClient = ApiClient();

  // String? _currentAddress;
  // _getCurrentAddress() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _currentAddress = prefs.getString('currentLocation') ?? '';
  // }
  List<Product> products = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://8c155025-93d6-4ead-a36d-9afdf9c1f291.mock.pstmn.io/recommend/items?page=0'));

    if (response.statusCode == 200) {
      final jsonBody = response.body;
      final productResponse = ProductResponse.fromJson(jsonDecode(jsonBody));

      setState(() {
        products = productResponse.data.products;
      });
    } else {
      // Handle error
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // _getCurrentAddress();
    fetchData();
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
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Material(
              child: Container(
                padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(50),
                  // color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage('assets/images/menu.png'),
                      fit: BoxFit.fill),
                ),
                height: 200,
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
                                      fontSize: 20,
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

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended For you',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: const [
                    Text(
                      'Shop More',
                      style: TextStyle(color: appRed, fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: appRed,
                      size: 10,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // GridView of Products
          products.isNotEmpty ? Text(products[0].name) : const Text('loading')
        ],
      ),
    );
  }
}
