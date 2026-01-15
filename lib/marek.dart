class Marek {

  double wallet = 10.0;
  int garbageCart = 0;
  static const double sellingUnitPrice = 2.0;

  //Getter and setter for wallet
  double get getWallet {
    return this.wallet;
  }

  set setWallet (double wallet) {
    this.wallet = wallet;
  }


  //Getter and setter for garbage cart
  int get getGarbageCart {
    return this.garbageCart;
  }

  set setGarbageCart (int garbageCart) {
    this.garbageCart = garbageCart;
  }

  //Getter for single unit selling price
  double get getSellingUnitPrice {
    return this.getSellingUnitPrice;
  }

}