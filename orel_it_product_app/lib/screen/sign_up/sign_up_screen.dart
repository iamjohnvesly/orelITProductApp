import 'package:flutter/material.dart';

import '../../theme/base_text_style.dart';
import '../../widget/button.dart';
import '../../widget/common_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                      'Don\'t have an account',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'SIGN UP?',
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
                  hintText: 'Enter Fullname',
                  prefix: const Icon(
                    Icons.motion_photos_auto_rounded,
                    color: Colors.black,
                  ),
                  hintStyle: commonTextFieldTextStyle.copyWith(
                      color: const Color(0xff000000).withOpacity(0.3)),
                  controller: emailController,
                  textAlign: TextAlign.start,
                  validator: (val) {
                    if (nameController.text.isEmpty) {
                      return "Enter Text";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                commonTextField(
                  hintText: 'Enter Email address',
                  prefix: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  hintStyle: commonTextFieldTextStyle.copyWith(
                      color: const Color(0xff000000).withOpacity(0.3)),
                  controller: emailController,
                  textAlign: TextAlign.start,
                  validator: (val) {
                    if (emailController.text.isEmpty) {
                      return "Enter Text";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                commonTextField(
                  hintText: 'Enter Password',
                  prefix: const Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  hintStyle: commonTextFieldTextStyle.copyWith(
                      color: const Color(0xff000000).withOpacity(0.3)),
                  controller: emailController,
                  textAlign: TextAlign.start,
                  validator: (val) {
                    if (passwordController.text.isEmpty) {
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
