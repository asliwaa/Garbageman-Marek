import 'package:garbageman_marek/vendor.dart' as vendor;
import 'package:garbageman_marek/marek.dart' as marek;
import 'package:garbageman_marek/ui.dart' as ui;

import 'dart:io';

class Game {

  static const double transactionFee = 0.1;
  static const double sellingUnitPrice = 2.0;

  void runGame() {

    var player = marek.Marek();
    var draw = ui.Ui();
    var shop = vendor.Vendor();

    bool gameOn = true;

    while (gameOn) {

      draw.clearScreen();

      draw.logo();
      draw.walletAndGarbageCart(player.getWallet, player.getGarbageCart);

      draw.showMessage();

      int playersGarbage = player.getGarbageCart;
      double playersWallet = player.getWallet;

      if (playersWallet >= 50.0) {

        print ('YOU WON');
        gameOn = false;
        
      } else if (playersWallet == 1.4 && playersGarbage == 0){
        
        print('YOU LOST');
        gameOn = false;

      } else if (playersGarbage == 0) {

        draw.mustBuy();
        buyGarbage(player, shop, draw);

      } else if (playersGarbage > 0 && playersWallet <= 1.4) {

        draw.mustSell();
        sellGarbage(player, draw);

      }else if (playersGarbage >= 1 && playersWallet >= 1.5) {

        draw.chooseBuyOrSell();
        String? action = stdin.readLineSync();

        if (action == 'B') {
          buyGarbage(player, shop, draw);
        } else if (action == 'S') {
          sellGarbage(player, draw);
        } else {
          break;
        }

      }
    }
  }

  void buyGarbage(marek.Marek player, vendor.Vendor shop, ui.Ui draw) {
    draw.chooseBuyAmount();

    int? buyGarbageAmount = int.parse(stdin.readLineSync()!);

    double playersWallet = player.getWallet;

    double unitPrice = shop.generateGarbageUnitPrice();
    shop.setGarbageUnitPrice = unitPrice;

    double totalPrice = formatMoney((buyGarbageAmount * unitPrice) + transactionFee);

    if (buyGarbageAmount <= 0) {
      draw.invalidGarbageAmount();
      player.setWallet = formatMoney(playersWallet - transactionFee);
    } else if (totalPrice > playersWallet) {
      draw.notEnoughMoney(totalPrice, playersWallet);
      player.setWallet = formatMoney(playersWallet - transactionFee);
    } else if (totalPrice <= playersWallet){
      draw.boughtGarbage(buyGarbageAmount, unitPrice);
      player.setWallet = formatMoney(playersWallet - totalPrice);
      player.setGarbageCart = player.getGarbageCart + buyGarbageAmount;
    }
  }

  void sellGarbage(marek.Marek player, ui.Ui draw) {
    draw.chooseSellAmount();

    int? sellGarbageAmount = int.parse(stdin.readLineSync()!);
    double playersWallet = player.getWallet;

    double profit = sellingUnitPrice * sellGarbageAmount;

    if(sellGarbageAmount <= 0) {
      draw.invalidGarbageAmount();
      player.setWallet = formatMoney(playersWallet - transactionFee);
    }
    if(sellGarbageAmount > player.getGarbageCart) {
      draw.notEnoughGarbage(sellGarbageAmount, player.garbageCart);
      player.setWallet = formatMoney(playersWallet - transactionFee);
    } else if (sellGarbageAmount > 0 && sellGarbageAmount <= player.garbageCart) {
      draw.soldGarbage(sellGarbageAmount, profit - transactionFee);
      player.setWallet = formatMoney(playersWallet + profit - transactionFee);
      player.setGarbageCart = player.getGarbageCart - sellGarbageAmount;
    } else if (sellGarbageAmount < 0) {
    }
  }

  double formatMoney(double amount) {
    return double.parse(amount.toStringAsFixed(1));
  }

}

