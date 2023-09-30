import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';




double balance = 300;
String email = "";
String userName = "";

class Cycle {
  final String name;
  final double pricePerHour;
  final String img;

  Cycle(this.name, this.pricePerHour, this.img);
}

final List<Cycle> cycles = [
  Cycle('La Sovereign Bicycle', 70, "assets/images/g.png"),
  Cycle('X-Bicycle', 50, "assets/images/f.png"),
  Cycle('Octane Cycles',90, "assets/images/i.png"),
  Cycle('Schnell Cycles', 60, "assets/images/h.png"),
  Cycle('Hero Cycles', 60, "assets/images/a.png"),
  Cycle('Atlas Cycles', 40, 'assets/images/b.png'),
  Cycle('Avon Cycles', 30, 'assets/images/c.png'),
  Cycle('Hercules Cycles', 70, "assets/images/d.png"),
  Cycle('Montra', 60, "assets/images/e.png"),




];

class RentedCycle {
  final String name;
  final double pricePerHour;
  final String img;
  final int hoursLeft;

  RentedCycle(this.name, this.pricePerHour, this.img, this.hoursLeft);
}
List<RentedCycle> rentedCyclesList = [];
