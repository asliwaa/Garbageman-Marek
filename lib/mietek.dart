//Class representing the player
class Mietek {

  //Starting cash and garbage amount
  double wallet = 10.00;
  int garbageCart = 0;

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

}