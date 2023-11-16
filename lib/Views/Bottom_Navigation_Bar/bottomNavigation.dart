import 'package:flutter/material.dart';
import 'package:walletwise/Views/DashboardScreens/DashboardScreen.dart';
import 'package:walletwise/Views/SettingScreen/SettingScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // Pages corresponding to each item in the bottom navigation bar
  final List<Widget> _pages = const [
    DashboardScreen(),
    Center(child: Text('Crypto Screen')),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_yen_sharp),
            label: 'Crypto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
