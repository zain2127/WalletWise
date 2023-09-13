import 'package:flutter/material.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';
import 'package:walletwise/Utils/custominputfeild.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
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
                  "Forgot Password ",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Image.asset('assets/signin.jpg' ,height: 200,),
                const SizedBox(height: 20),
                CustomInput(hinttext: 'Email', controller: emailController, obsecure: false, validate: 'Enter Email',keyboardType: TextInputType.emailAddress,),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(),
                  child: loading == true ? const CircularProgressIndicator(color: Colors.white,): const Text("Send"),
                  onPressed: () async {
                    if(_formkey.currentState!.validate())
                    {
                      setState(() {
                        loading = true;
                      });
                      await AuthController().forgotPassword(emailController.text, context);
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
