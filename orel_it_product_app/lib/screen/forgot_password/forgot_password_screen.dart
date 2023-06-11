import 'package:flutter/material.dart';

import '../../widget/button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailForgotPasswordController =
        TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(color: Colors.indigo[900], Icons.arrow_back_ios_new)),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'FORGOT YOUR',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'PASSWORD?',
                      style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailForgotPasswordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your email";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonFilled(lable: 'Submit', action: () {}),
                const SizedBox(
                  height: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
