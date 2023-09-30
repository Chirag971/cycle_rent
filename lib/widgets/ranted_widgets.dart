import 'package:cycle_ranting/pages/rent_screen.dart';
import 'package:cycle_ranting/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentedWid extends StatelessWidget {
  final RentedCycle cycle;

  RentedWid(this.cycle);

  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 8,
          ),
          // Left side - Product Image
          Expanded(
            flex: 2, // Takes 2/3 of the available space
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 110,
                    decoration: BoxDecoration(
                      // shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70,
                      image: DecorationImage(
                        image: AssetImage(
                          cycle.img,
                        ),
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          // Right side - Product Details
          Expanded(
            flex: 2, // Takes 1/3 of the available space

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Padding(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 8),
                  child: Text(
                    "${cycle.name}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Product Price
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 0),
                  child: Row(
                    children: [
                      Text(
                        '-₹${cycle.pricePerHour}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '4.3',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 8),
                  child: Row(
                    children: [
                      Text(
                        '${cycle.hoursLeft} Hours left!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red.shade500,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.timer,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
