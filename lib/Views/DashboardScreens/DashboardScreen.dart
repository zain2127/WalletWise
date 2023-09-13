import 'package:flutter/material.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard Screen'), actions: [IconButton(onPressed: (){AuthController().signOut(context);}, icon: Icon(Icons.logout))],),
    );
  }
}
