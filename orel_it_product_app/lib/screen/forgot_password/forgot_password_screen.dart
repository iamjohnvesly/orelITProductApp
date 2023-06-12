import 'package:flutter/material.dart';

import '../../theme/base_text_style.dart';
import '../../widget/button.dart';
import '../../widget/common_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
          key: formKey,
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
                commonTextField(
                  hintText: 'Enter Email address',
                  prefix: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  hintStyle: commonTextFieldTextStyle.copyWith(
                      color: const Color(0xff000000).withOpacity(0.3)),
                  controller: emailForgotPasswordController,
                  textAlign: TextAlign.start,
                  validator: (val) {
                    if (emailForgotPasswordController.text.isEmpty) {
                      return "Enter Text";
                    }
                    return null;
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
