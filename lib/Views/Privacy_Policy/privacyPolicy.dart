import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Privacy Policy',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            'Last updated: November 16, 2023',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16.0),
          Text(
            'This Privacy Policy covers the use of the Expense Tracking and Crypto Tracking modules within our app.',
          ),
          SizedBox(height: 16.0),
          Text(
            '1. Expense Tracking Module',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'The Expense Tracking module allows users to input and track their expenses. We do not collect any personal or financial information entered into the app. All data is stored locally on the user\'s device and is not transmitted to any external servers.',
          ),
          SizedBox(height: 16.0),
          Text(
            '2. Crypto Tracking Module',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'The Crypto Tracking module enables users to monitor and analyze their cryptocurrency investments. No personal or financial data is collected or stored by the app. The cryptocurrency portfolio information is stored locally on the user\'s device.',
          ),
          SizedBox(height: 16.0),
          Text(
            'By using our app, you agree to the terms and conditions outlined in this Privacy Policy. Any changes to this policy will be posted on this page.',
          ),
        ],
      ),
    );
  }
}
