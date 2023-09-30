import 'package:cycle_ranting/pages/rent_screen.dart';
import 'package:cycle_ranting/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayWid extends StatelessWidget {
  final Cycle cycle;

  DisplayWid(this.cycle);

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
                        '₹${cycle.pricePerHour}',
                        style: TextStyle(
                          fontSize: 15,
                          // color: Colors.green,
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
                        // color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RantPage(cycle)));
                      },
                      icon: Icon(Icons.directions_bike_outlined),
                      label: Text('Rent Now')),
                ),
                SizedBox(
                  height: 4,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
