import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_ranting/pages/bottomnavi_page.dart';
import 'package:cycle_ranting/pages/login_page.dart';
import 'package:cycle_ranting/variables.dart';
import 'package:cycle_ranting/widgets/product_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final box = GetStorage();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch initial data when the widget is initialized.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 55,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$currentUsername',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Text(
                    "$cmail",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Handle the Home item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Account Balance'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BottomNavi(2)));

                // Handle the Account Balance item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth user = FirebaseAuth.instance;
                user.signOut();
                box.remove('uid');

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));

                // Handle the Logout item tap
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: cycles.length,
        itemBuilder: (context, index) {
          final Cycle cycle = cycles[index];
          return DisplayWid(cycle);
        },
      ),
    );
  }
}
