import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalxtest/controller/home_user_controller.dart';
import 'package:totalxtest/view/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (context) => HomeUserController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TotalxUsers',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Homepage(),
        
      ),
    );
  }
}
