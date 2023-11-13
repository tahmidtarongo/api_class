// ignore_for_file: use_build_context_synchronously

import 'package:api_class/Screen/Auth/sign_in_screen.dart';
import 'package:api_class/Screen/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Repo/sign_up_repo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpNameController.dispose();
    signUpPhoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up Here',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: signUpEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Please enter your email.',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: signUpPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Please enter your password.',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: signUpPhoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
                hintText: 'Please enter phone number.',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: signUpNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Please enter Your Name.',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  bool isSignUpDone = await signUpRepo(
                      email: signUpEmailController.text, password: signUpPasswordController.text, name: signUpNameController.text, phone: signUpPhoneController.text);

                  if (isSignUpDone) {
                    EasyLoading.showSuccess('SussesFully Done');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  } else {
                    EasyLoading.showError('Error');
                  }
                },
                child: const Text('Sign Up')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                },
                child: const Text('Log in')),
          ],
        ),
      ),
    );
  }
}
