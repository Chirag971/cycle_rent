import 'dart:async';

import 'package:cycle_ranting/pages/bottomnavi_page.dart';
import 'package:cycle_ranting/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                GetStorage().read('uid') == null ? LoginPage() : BottomNavi(0),
          )),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
