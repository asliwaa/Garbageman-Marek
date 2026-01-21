import 'dart:io';

enum PlayerAction {
  buy,
  sell,
  error
}

abstract class GameInterface {
  String? message;
  void showMessage();
  void showLogo();
  void showWalletAndGarbage(double wallet, int garbageCart);

  PlayerAction chooseBuyOrSell();

  int chooseBuyAmount();
  int chooseSellAmount();
  
  void showNotEnoughMoney(double totalPrice, double wallet);
  void showBoughtGarbage(int amount, double unitPrice);
  void showNotEnoughGarbage(int amount, int currentCart);
  void showSoldGarbage(int amount, double profit);
  void showInvalidGarbageAmount();

  void showWin();
  void showLoss();
  void clearScreen();
}

//Class that represents the UI
class ConsoleUi implements GameInterface {

  @override
  String? message = '';

  @override
  void showMessage() {
    if(message != '') {
      print('\n*** $message ***\n');
      message = '';
    }
  }

  @override
  void showLogo() {
    print('   GARBAGE MAN - MIETEK');
  }

  @override
  void showWalletAndGarbage(double wallet, int garbageCart) {
    print('Wallet: $wallet\$  Garbage Cart: $garbageCart');
  }

  @override
  PlayerAction chooseBuyOrSell() {
    stdout.write('Choose action [ (B)uy | (S)ell ]: ');
    String? action = stdin.readLineSync();

    if (action?.toUpperCase() == 'B') {
      return PlayerAction.buy;
    } else if (action?.toUpperCase() == 'S') {
      return PlayerAction.sell;
    } else {
      return PlayerAction.error;
    }
  }

  @override
  int chooseBuyAmount() {
    stdout.write('Buy garbage (amount): ');
    int? buyGarbageAmount = int.parse(stdin.readLineSync()!);
    return buyGarbageAmount;
  }

  @override
  int chooseSellAmount() {
    stdout.write('Sell garbage (amount): ');
    int? sellGarbageAmount = int.parse(stdin.readLineSync()!);
    return sellGarbageAmount;
  }

  @override
  void showNotEnoughMoney(double totalPrice, double wallet) {
    message = ('Total price was $totalPrice\$, you have $wallet\$.\$.');
  }

  @override
  void showBoughtGarbage(int amount, double unitPrice) {
    message = ('You bought $amount garbage pieces for $unitPrice\$ each.\$.');
  }
  
  @override
  void showNotEnoughGarbage(int amount, int currentCart) {
    message = ('You wanted to sell $amount pieces of garbage, but have $currentCart in your cart.\$.');
  }

  @override
  void showSoldGarbage(int amount, double profit) {
    message = ('You sold $amount pieces of garbage and earned $profit\$.');
  }

  @override
  void showInvalidGarbageAmount() {
    message = ('Invalid garbage amount.');
  }

  @override
  void showWin() {
    print('YOU WON');
  }

  @override
  void showLoss() {
    print('YOU LOST');
  }

  @override
  void clearScreen() {
    print('\x1B[2J\x1B[0;0H');
  }

}