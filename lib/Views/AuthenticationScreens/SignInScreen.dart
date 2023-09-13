import 'package:flutter/material.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';
import 'package:walletwise/Utils/custominputfeild.dart';
import 'package:walletwise/Views/AuthenticationScreens/SignUpScreen.dart';
import 'package:walletwise/Views/AuthenticationScreens/ForgotPasswordScreen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign In to Wallet Wise",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                Image.asset('assets/signin.jpg' ,height: 200,),
                const SizedBox(height: 20),
                 CustomInput(hinttext: 'Email', controller: emailController, obsecure: false, validate: 'Enter Email',keyboardType: TextInputType.emailAddress,),
                 CustomInput(hinttext: 'Password', controller: passwordController, obsecure: true, validate: 'Enter Password',keyboardType: TextInputType.visiblePassword,),
                Padding(
                  padding: const EdgeInsets.only(right:16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));}, child: const Text('Forgot Password'))),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text("Sign In"),
                  onPressed: () {
                    if((_formkey.currentState!.validate()))
                      {
                        AuthController().signIn(emailController.text, passwordController.text, context);
                      }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account ?'),
                    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));}, child: const Text('Sign Up'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
