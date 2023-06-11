import 'package:flutter/material.dart';

import '../../api/api_client.dart';
import '../../theme/base_text_style.dart';
import '../../widget/button.dart';
import '../../widget/common_text_field.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../home/home_screen.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  Future<void> performLogin(context) async {
    try {
      final response = await _apiClient.loginAPI(
          email: emailController.text, password: passwordController.text);

      // Handle the response here
      if (response['error_code'] == null) {
        String refreshToken = response['refresh_token'];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      refreshToken: refreshToken,
                    )));
        emailController.clear();
        passwordController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Error: Invalid Email or Password'),
          backgroundColor: Colors.pinkAccent[400],
        ));
      }
    } catch (e) {
      // Handle any errors that occur during the login process
      print('error');
      print(e);
    }
  }

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
                        Icons.lock_outlined,
                        color: Colors.black,
                      ),
                      isPass: true,
                      change: (val) {
                        setState(() {});
                      },
                      hintStyle: commonTextFieldTextStyle.copyWith(
                          color: const Color(0xff000000).withOpacity(0.3)),
                      controller: passwordController,
                      textAlign: TextAlign.start,
                      validator: (val) {
                        if (passwordController.text.isEmpty) {
                          return "Enter your password";
                        }
                      },
                      onFieldSubmitted: (p0) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonFilled(
                        lable: 'Login',
                        action: () {
                          performLogin(context);
                        }),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.indigo[900],
                                    letterSpacing: 2.0),
                              )),
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
                                    color: Colors.indigo[900],
                                    letterSpacing: 2.0),
                              )),
                        ),
                      ],
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
