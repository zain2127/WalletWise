import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:walletwise/Views/AuthenticationScreens/SignInScreen.dart';
import 'package:walletwise/Views/Bottom_Navigation_Bar/bottomNavigation.dart';
import 'package:walletwise/Views/DashboardScreens/DashboardScreen.dart';
import 'package:walletwise/firebase_options.dart';

import 'data/expense_data.dart';

bool isLoggedIn = false;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox('expense_database');
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user != null) {
      isLoggedIn = true;
      runApp(const MyApp());
    } else {
      isLoggedIn = false;
      runApp(const MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: isLoggedIn ? MyHomePage() : const SignInScreen(),
      ),
    );
  }
}
