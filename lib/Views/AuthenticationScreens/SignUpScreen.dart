import 'package:flutter/material.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';
import 'package:walletwise/Views/AuthenticationScreens/SignInScreen.dart';
import 'package:walletwise/Utils/custominputfeild.dart';
import 'package:walletwise/Views/AuthenticationScreens/ForgotPasswordScreen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
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
                  "Sign Up to Wallet Wise ",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Image.asset('assets/signin.jpg' ,height: 200,),
                const SizedBox(height: 20),
                CustomInput(hinttext: 'Email', controller: emailController, obsecure: false, validate: 'Enter Email',keyboardType: TextInputType.emailAddress,),
                CustomInput(hinttext: 'Password', controller: passwordController, obsecure: false, validate: 'Enter Password',keyboardType: TextInputType.visiblePassword,),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: loading ? CircularProgressIndicator(color: Colors.white,):Text("Sign Up"),
                  onPressed: () async{
                    if(_formkey.currentState!.validate())
                    {
                      setState(() {
                        loading = true;
                      });
                      await AuthController().signUp(emailController.text, passwordController.text, context);
                      setState(() {
                        loading = false;
                      });
                    }
                    },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ?'),
                    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));}, child: const Text('Sign In'))
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
