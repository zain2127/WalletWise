import 'package:flutter/material.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';
import 'package:walletwise/Views/AuthenticationScreens/SignUpScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                child: const Text("Sign In"),
                onPressed: () {AuthController().signIn(emailController.text, passwordController.text, context);},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account ?'),
                  TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));}, child: Text('Sign Up'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
