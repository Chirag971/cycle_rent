// import 'package:cycle_ranting/loginphone/login_page.dart';
import 'package:cycle_ranting/pages/bottomnavi_page.dart';
import 'package:cycle_ranting/pages/login_page.dart';
import 'package:cycle_ranting/pages/splash_page.dart';
// import 'package:cycle_ranting/login/phone_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cycle Ranting',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: PhoneNumberLoginScreen(),
      home: Welcome_Screen(),
      // home: SignInWithMobile(),
    );
  }
}
