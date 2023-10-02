import 'package:cycle_ranting/variables.dart';
import 'package:cycle_ranting/widgets/ranted_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Trips'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: (rentedCyclesList.length != 0)
          ? ListView.builder(
              itemCount: rentedCyclesList.length,
              itemBuilder: (context, index) {
                final rentedCycle = rentedCyclesList[index];
                return RentedWid(rentedCycle);
              },
            )
          : Center(
              child: Text("Cycles that you rent will appear here.",
                  style: TextStyle(fontSize: 14, color: Colors.grey))),
    );
  }
}
