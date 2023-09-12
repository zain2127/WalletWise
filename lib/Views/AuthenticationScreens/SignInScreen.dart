import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Wallet Wise",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 200,
              child:AssetImage('assets/signin.jpg'),,
            )
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Sign In"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
