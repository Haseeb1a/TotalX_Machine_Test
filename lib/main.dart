import 'package:flutter/material.dart';
import 'package:totalxtest/view/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
              debugShowCheckedModeBanner: false,
      title: 'TotalxUsers',
      theme: ThemeData(
        
        useMaterial3: true,
      ),
      home: const Loginpage(),
    );
  }
}
