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

    draw.logo();
    draw.walletAndGarbageCart(player.getWallet, player.getGarbageCart);

    var playersGarbage = player.getGarbageCart;
    var playersWallet = player.getWallet;

    if (playersGarbage == 0) {
      draw.mustBuy();
      int? buyGarbageAmount = int.parse(stdin.readLineSync()!);

      double unitPrice = shop.generateGarbageUnitPrice();
      shop.setGarbageUnitPrice = unitPrice;

      double totalPrice = (buyGarbageAmount * unitPrice) + transactionFee;

      if (totalPrice > player.getWallet) {
        draw.notEnoughMoney(totalPrice, player.getWallet);
        player.setWallet = player.getWallet - transactionFee;
      } else if (totalPrice <= player.getWallet){
        draw.boughtGarbage(buyGarbageAmount, unitPrice);
        player.setWallet = player.getWallet - totalPrice;
      }

    } else if (playersGarbage >0 && playersWallet <= 1.4) {
      draw.mustSell();
      int? sellGarbageAmount = int.parse(stdin.readLineSync()!);

      double profit = sellingUnitPrice * sellGarbageAmount;

      if(sellGarbageAmount > player.getGarbageCart) {
        draw.notEnoughGarbage(sellGarbageAmount, player.garbageCart);
        player.setWallet = player.getWallet - transactionFee;
      } else if (sellGarbageAmount > 0 && sellGarbageAmount <= player.garbageCart) {
        player.setWallet = player.getWallet + profit - transactionFee;
      }

    }else if (playersGarbage == 0 && playersWallet <= 1.4) {
      print('YOU LOST');
    }else {
      draw.chooseBuyOrSell();
      String? action = stdin.readLineSync();
    }


  }

}
