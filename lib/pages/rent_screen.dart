import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_ranting/pages/rented_page.dart';
import 'package:cycle_ranting/pages/wallet_page.dart';
import 'package:cycle_ranting/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:cycle_ranting/pages/home_page.dart';
import 'package:flutter/material.dart';

class RantPage extends StatefulWidget {
  final Cycle cycle;

  RantPage(this.cycle);

  @override
  _RentalScreenState createState() => _RentalScreenState(cycle);
}

class _RentalScreenState extends State<RantPage> {
  final Cycle cycle;
  _RentalScreenState(this.cycle);
  int selectedDuration = 1; // Default rental duration in hours
  double totalPrice = 0.0; // Total rental cost
  @override
  void initState() {
    // TODO: implement initState
    selectedDuration = 1;
    totalPrice = selectedDuration * widget.cycle.pricePerHour;
    super.initState();
  }

  void _handleDurationChange(int duration) {
    setState(() {
      selectedDuration = duration;
      totalPrice = duration * widget.cycle.pricePerHour;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent ${widget.cycle.name}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  // width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // fit: BoxFit.cover,

                      image: AssetImage(cycle.img),
                    ),
                  ),
                ),
              ),
              Text(
                cycle.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₹${cycle.pricePerHour.toStringAsFixed(2)} per hour',
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).colorScheme.primary
                    // color: Colors.blue,
                    ),
              ),
              Text(
                'Select Rental Duration:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildDurationButton(1),
                  _buildDurationButton(2),
                  _buildDurationButton(3),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Total Cost: ₹$totalPrice',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Implement rental logic here
                  // This is a placeholder.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("cycle")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return AlertDialog(
                              title: Text('Rental Confirmation'),
                              content: (balance >= totalPrice)
                                  ? Text(
                                      'You rented ${cycle.name} for $selectedDuration hours.'
                                      '\nBalance: ₹$balance'
                                      '\nPayment: -₹$totalPrice'
                                      '\nRemaining: ₹${balance - totalPrice}')
                                  : Text("You Don't have Sufficient Ballance"
                                      "\nYou need to add ₹${totalPrice - balance}. to Your Wallet."),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancle")),
                                TextButton(
                                  onPressed: () {
                                    if (balance >= totalPrice) {
                                      balance -= totalPrice;
                                      var rcycle = RentedCycle(
                                          cycle.name,
                                          totalPrice,
                                          cycle.img,
                                          selectedDuration);
                                      rentedCyclesList.add(rcycle);
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RentedPage(),
                                          ));
                                    } else {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WalletPage()));
                                    }
                                  },
                                  child: (balance >= totalPrice)
                                      ? Text('Pay')
                                      : Text('Add Balance'),
                                ),
                              ],
                            );
                          }
                        },
                      );
                    },
                  );
                },
                child: Text('Rent ${widget.cycle.name}'),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Description:-",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  // color: Colors.blue,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Are you ready to elevate your cycling experience? Look no further than this premium performance bicycle that's now available for sale. Whether you're a dedicated enthusiast or a casual rider, this bike offers a winning combination of style, speed, and precision engineering."
                "\n\n"
                "Whether you're seeking an agile road bike for speedy commutes, a dependable companion for off-road adventures, or a versatile hybrid for urban and trail riding, this bicycle can handle it all. Its exceptional performance is matched only by its adaptability to different riding styles."
                "\n\n"
                "This bicycle has been meticulously maintained and regularly serviced by a certified technician. It's in excellent condition, ready to hit the road and provide you with countless hours of riding enjoyment."
                "\n\n"
                "Whether you're a seasoned cyclist looking for an upgrade or a beginner seeking a high-quality entry point into the world of biking, this bicycle is designed to meet your needs."
                "\n\n"
                "While offering premium features, this bicycle comes at a reasonable price point, making it an excellent value for anyone looking to invest in their cycling experience."
                "\n\n"
                "Don't miss the opportunity to own this exceptional bicycle. It's your ticket to exploring new horizons, staying active, and enjoying the thrill of the open road. Grab this chance to own a bicycle that combines performance and style seamlessly."
                "\n\n"
                "Contact us today to arrange a test ride and experience the joy of cycling like never before. Act fast; this premium bicycle won't be available for long!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDurationButton(int duration) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        _handleDurationChange(duration);
      },
      child: Text('$duration Hour'),
    );
  }
}
