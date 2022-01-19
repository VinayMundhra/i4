import 'package:flutter/material.dart';
import 'package:i4_consulting_app/screens/home_page.dart';
import 'package:i4_consulting_app/utils/routes.dart';
import 'screens/otpscreen.dart';
import 'screens/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const RegisterPage(),
        MyRoutes.otpRoute: (ctx) => const OtpScreen(),
        MyRoutes.registerRoute: (context) => const RegisterPage(),
        MyRoutes.homeRoute: (ctx) => const HomePage(),
      },
    );
  }
}
