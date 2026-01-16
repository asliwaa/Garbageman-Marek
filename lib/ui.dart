import 'package:garbageman_marek/vendor.dart' as vendor;
import 'package:garbageman_marek/marek.dart' as marek;

import 'dart:io';

class Ui {
  void logo() {
    print('   GARBAGE MAN - MAREK\n\n');
  }

  void walletAndGarbageCart(var wallet, var garbageCart) {
    print('Wallet: $wallet\$  Garbage Cart: $garbageCart');
  }

  void mustBuy() {
    print('No garbage to sell. You must buy some.');
    stdout.write('Buy garbage (amount): ');
  }

  void notEnoughMoney(double totalPrice, double wallet) {
    print('Total price was $totalPrice\$, you only have $wallet\$.');
  }

  void  boughtGarbage(int buyGarbageAmount, double unitPrice) {
    print('You bought $buyGarbageAmount garbage pieces for $unitPrice\$ each.');
  }

  void mustSell() {
    print('Not enought money in wallet to buy anything. You must sell something.');
    stdout.write('Sell garbage (amount): ');
  }

  void chooseBuyOrSell() {
    stdout.write('Choose action [ (B)uy | (S)ell ]:');
  }

}