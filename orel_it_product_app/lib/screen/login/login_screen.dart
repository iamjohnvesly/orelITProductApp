import 'package:flutter/material.dart';

import '../../widget/button.dart';
import '../forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Image.asset('assets/images/welcome.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                width: double.infinity,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
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
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonFilled(lable: 'Login', action: () {}),
                    const SizedBox(
                      height: 1,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordScreen()));
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.indigo[900], letterSpacing: 2.0),
                          )),
                    ),
                  ],
                )),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
