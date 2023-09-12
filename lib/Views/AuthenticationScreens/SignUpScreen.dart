import 'package:flutter/material.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
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
              Image.asset('assets/signin.jpg' ,height: 200,),
              const SizedBox(height: 20),
               TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 20),
               TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () {AuthController().signUp(emailController.text, passwordController.text, context);},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
