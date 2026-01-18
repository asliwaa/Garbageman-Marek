import 'dart:math';

//Class representing the garbage vendor
class Vendor {

  //Garbage price per unit, will be generated randomly for each transaction
  double garbageUnitPrice = 0.0;

  //Setter for garbage unit price
  set setGarbageUnitPrice(double garbageUnitPrice) {
    this.garbageUnitPrice = garbageUnitPrice;
  }

  //Generates a random number decimal from 1.5 to 2.5
  double generateGarbageUnitPrice () {
    var randomPrice = Random().nextDouble() * (2.5 - 1.5) + 1.5;
    return double.parse(randomPrice.toStringAsFixed(1));
  }

}