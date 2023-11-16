import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Terms and Conditions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            'Last updated: November 16, 2023',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16.0),
          Text(
            'Please read these terms and conditions carefully before using our app.',
          ),
          SizedBox(height: 16.0),
          Text(
            '1. Acceptance of Terms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'By accessing or using the app, you agree to be bound by these terms and conditions. If you do not agree with any part of these terms, you may not use the app.',
          ),
          SizedBox(height: 16.0),
          Text(
            '2. Use of the App',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'The app is provided "as is" and is for informational purposes only. We are not responsible for any errors or omissions in the content of the app.',
          ),
          SizedBox(height: 16.0),
          Text(
            '3. User Accounts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'To access certain features of the app, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account information.',
          ),
          SizedBox(height: 16.0),
          Text(
            '4. Changes to Terms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'We reserve the right to update or change these terms and conditions at any time. Your continued use of the app after any changes indicate your acceptance of the modified terms.',
          ),
          SizedBox(height: 16.0),
          Text(
            'Please review our Privacy Policy, which also governs your use of the app.',
          ),
        ],
      ),
    );
  }
}
