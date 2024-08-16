import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalxtest/controller/home_user_controller.dart';
import 'package:totalxtest/firebase_options.dart';
import 'package:totalxtest/view/auth/login_page.dart';
// import 'package:totalxtest/firebase_options.dart';
// import 'package:totalxtest/firebase_options.dart';
import 'package:totalxtest/view/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: const Loginpage(),
      ),
    );
  }
}
