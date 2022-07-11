// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:recipe_app/widgets/textinput.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final resetPass = TextEditingController();

  void dispose() {
    resetPass.dispose();
    super.dispose();
  }

  void _showAlertDialog({String? content, String? title}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.deepPurple[600],
        title: Text(title!, style: TextStyle(color: Colors.white)),
        content: Text(
          content!,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              resetPass.clear();
              Navigator.pop(context);
            },
            child: Text('OK', style: TextStyle(color: Colors.white)),
          )
        ],
        elevation: 24,
      ),
    );
  }

  Future sendLink() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetPass.text.trim());
      _showAlertDialog(title: 'Done', content: 'Please Check your Email.');
    } on FirebaseAuthException {
      _showAlertDialog(
          title: 'Wrong Email..', content: 'Wrong email,Enter Again Please');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 200,
                  child: Container(
                    child: Center(
                      child: Text(
                        'Enter Your Email and we will send you a password reset Link',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: MyTextFormFeild(
                    controller: resetPass,
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: sendLink,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Send Link',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
