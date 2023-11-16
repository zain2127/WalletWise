import 'package:flutter/material.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';
import 'package:walletwise/Views/Privacy_Policy/Terms_and_Condition.dart';
import 'package:walletwise/Views/Privacy_Policy/privacyPolicy.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        reverse: true,
        children: [
          ListTile(
            onTap: () => AuthController().signOut(context),
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen())),
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TermsAndConditionsScreen())),
            leading: const Icon(Icons.book_online_outlined),
            title: const Text('Terms & Condition'),
          ),
        ],
      ),
    );
  }
}
