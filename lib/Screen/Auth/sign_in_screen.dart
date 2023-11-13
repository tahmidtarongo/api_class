// ignore_for_file: use_build_context_synchronously

import 'package:api_class/Repo/sign_in_repo.dart';
import 'package:api_class/Screen/Auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Home/home.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Future<void> setRememberMe({required String email, required String password}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('user_email', email);
  //   await prefs.setString('user_pass', password);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Log In',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Please enter your email.',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Please enter your password.',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Switch(
                      value: rememberMe,
                      onChanged: (value) async {
                        setState(() {
                          rememberMe = value;
                        });

                        // final SharedPreferences prefs = await SharedPreferences.getInstance();
                        // await prefs.setBool('isRememberMe', value);
                      },
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController forgotEmailController = TextEditingController();
                          return Dialog(
                              child: Container(
                            width: 300,
                            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                                    controller: forgotEmailController,
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                    },
                                    child: const Text(
                                      'Sent Mail',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                        },
                      );
                    },
                    child: const Text('Forgot Password')),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  EasyLoading.show(status: 'loading');
                  await signInRepo(password: passwordController.text, email: emailController.text);
                  EasyLoading.dismiss();
                },
                child: const Text('LogIn')),
            TextButton(
                onPressed: () {
                  // _handleSignIn();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                child: const Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
