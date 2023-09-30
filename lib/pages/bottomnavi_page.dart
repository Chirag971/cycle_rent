import 'package:cycle_ranting/pages/home_page.dart';
import 'package:cycle_ranting/pages/rented_page.dart';
import 'package:cycle_ranting/pages/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavi extends StatefulWidget{
  int myIndex= 0;
  BottomNavi(this.myIndex);
  @override
  State<BottomNavi> createState() => _BottomNaviState(myIndex);
}

class _BottomNaviState extends State<BottomNavi> {
  int myIndex= 0;
  _BottomNaviState(this.myIndex);
  List<Widget> widgetList =  [
    HomePage(),
    RentedPage(),
    WalletPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: (index){
          setState(() {
            myIndex = index;
          });

        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike_outlined),
            label: 'My Trips',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
            // backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}