import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  String validate;
  TextEditingController controller;
  bool obsecure;
  final String hinttext;
  Icon ? icon;
  TextInputType ? keyboardType;
  CustomInput({super.key , required this.hinttext , this.icon , required this.controller ,
    required this.obsecure, required this.validate , this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 8),
      child: TextFormField(
        obscureText: obsecure,
        controller: controller,
        keyboardType: keyboardType,
        validator: (value){
          if(controller.text.isEmpty)
            {
              return validate;
            }
          return null;
        },
        decoration: InputDecoration(

          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          hintText: hinttext,
          suffixIcon: icon,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}