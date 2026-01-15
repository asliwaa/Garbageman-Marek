import 'dart:math';

class Vendor {

  double garbageUnitPrice = 0.0;

  double get getGarbageUnitPrice {
    return this.garbageUnitPrice;
  }

  set setGarbageUnitPrice(double garbageUnitPrice) {
    this.garbageUnitPrice = garbageUnitPrice;
  }

  double drawGarbageUnitPrice () {
    var randomPrice = Random().nextDouble() * (2.5 - 1.5) + 1.5;
    return double.parse(randomPrice.toStringAsFixed(1));
  }

}