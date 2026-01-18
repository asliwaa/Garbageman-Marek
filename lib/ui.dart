import 'dart:io';

class Ui {

  String _message = ''; 

  void showMessage() {
    if (_message.isNotEmpty) {
      print('\n*** $_message ***\n');
      _message = '';
    }
  }

  void logo() {
    print('   GARBAGE MAN - MAREK');
  }

  void walletAndGarbageCart(var wallet, var garbageCart) {
    print('Wallet: $wallet\$  Garbage Cart: $garbageCart');
  }

  void mustBuy() {
    _message = 'No garbage to sell. You must buy some.';
  }
  
  void notEnoughMoney(double totalPrice, double wallet) {
    _message = 'Total price was $totalPrice\$, you only have $wallet\$.';
  }

  void boughtGarbage(int buyGarbageAmount, double unitPrice) {
    _message = 'You bought $buyGarbageAmount garbage pieces for $unitPrice\$ each.';
  }

  void mustSell() {
    _message = 'Not enough money in wallet to buy anything. You must sell something.';
  }

  void notEnoughGarbage(int sellGarbageAmount, int garbageCart) {
    _message = 'You wanted to sell $sellGarbageAmount pieces of garbage, but have only $garbageCart in your cart.';
  }

  void soldGarbage(int sellGarbageAmount, double profit) {
    _message = 'You sold $sellGarbageAmount pieces of garbage and earned $profit';
  }

  void invalidGarbageAmount() {
    _message = 'Invalid garbage amount.';
  }

  void chooseBuyAmount() {
    stdout.write('Buy garbage (amount): ');
  }

  void chooseSellAmount() {
    stdout.write('Sell garbage (amount): ');
  }

  void chooseBuyOrSell() {
    stdout.write('Choose action [ (B)uy | (S)ell ]: ');
  }

  void clearScreen() {
    print('\x1B[2J\x1B[0;0H');
  }

}