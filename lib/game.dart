import 'package:garbageman_marek/vendor.dart' as vendor;
import 'package:garbageman_marek/mietek.dart' as mietek;
import 'package:garbageman_marek/ui.dart' as ui;

//Class that controlls the game logic
class Game {

  //Transaction fee applied for every transaction (succesfull and unsuccesfull)
  static const double transactionFee = 0.10;
  //Players garbage selling price
  static const double sellingUnitPrice = 2.00;

  final ui.GameInterface view;

  Game(this.view);

  //Runs the game main logic
  void runGame() {

    var player = mietek.Mietek();
    var shop = vendor.Vendor();

    //Flag for game status control
    bool gameOn = true;

    while (gameOn) {

      view.clearScreen();

      view.showLogo();
      view.showWalletAndGarbage(player.getWallet, player.getGarbageCart);

      view.showMessage();

      int playersGarbage = player.getGarbageCart;
      double playersWallet = player.getWallet;

      if (playersWallet >= 50.0) {

        view.showWin();
        gameOn = false;
        
      } else if (playersWallet < 1.5 && playersGarbage == 0){
        
        view.showLoss();
        gameOn = false;

      } else {

        ui.PlayerAction action = view.chooseBuyOrSell();
        
        if (action == ui.PlayerAction.buy) {
          buyGarbage(player, shop);
        } else if (action == ui.PlayerAction.sell) {
          sellGarbage(player);
        } else {
          gameOn = false;
        }

      }
    }
  }

  //Handles logic for buying garbage
  void buyGarbage(mietek.Mietek player, vendor.Vendor shop) {
    int buyGarbageAmount = view.chooseBuyAmount();

    double playersWallet = player.getWallet;
    double unitPrice = shop.generateGarbageUnitPrice();
    shop.setGarbageUnitPrice = unitPrice;

    double totalPrice = formatMoney(buyGarbageAmount * unitPrice);

    if (buyGarbageAmount <= 0) {
      view.showInvalidGarbageAmount();
      player.setWallet = formatMoney(playersWallet - transactionFee);
    } else if (totalPrice > playersWallet) {
      view.showNotEnoughMoney(totalPrice, playersWallet);
      player.setWallet = formatMoney(playersWallet - transactionFee);
    } else if (totalPrice <= playersWallet){
      view.showBoughtGarbage(buyGarbageAmount, unitPrice);
      player.setWallet = formatMoney(playersWallet - totalPrice - transactionFee);
      player.setGarbageCart = player.getGarbageCart + buyGarbageAmount;
    }
  }

  //Handles logic for selling garbage
  void sellGarbage(mietek.Mietek player) {
    int sellGarbageAmount = view.chooseSellAmount();

    double playersWallet = player.getWallet;
    double profit = sellingUnitPrice * sellGarbageAmount;

    if(sellGarbageAmount <= 0) {
      view.showInvalidGarbageAmount();
      player.setWallet = formatMoney(playersWallet - transactionFee);
    } else if(sellGarbageAmount > player.getGarbageCart) {
      view.showNotEnoughGarbage(sellGarbageAmount, player.garbageCart);
      player.setWallet = formatMoney(playersWallet - transactionFee);
    } else if (sellGarbageAmount > 0 && sellGarbageAmount <= player.garbageCart) {
      view.showSoldGarbage(sellGarbageAmount, profit - transactionFee);
      player.setWallet = formatMoney(playersWallet + profit - transactionFee);
      player.setGarbageCart = player.getGarbageCart - sellGarbageAmount;
    }
  }

  //Formats decimal numbers to two decimal places
  double formatMoney(double amount) {
    return double.parse(amount.toStringAsFixed(2));
  }

}

