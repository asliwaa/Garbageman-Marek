import 'package:garbageman_marek/vendor.dart' as vendor;
import 'package:garbageman_marek/marek.dart' as marek;

class Ui {
  void logo() {
    print('   GARBAGE MAN - MAREK\n\n');
  }

  void walletAndGarbageCart(var wallet, var garbageCart) {
    print('Wallet: $wallet\$  Garbage Cart: $garbageCart');
  }

  void mustBuy() {
    print('No garbage to sell. You must buy some.');
    print("Buy garbage (amount): ");
  }

  void chooseBuyOrSell() {
    print('Choose action [ (B)uy | (S)ell ]:');
  }

}