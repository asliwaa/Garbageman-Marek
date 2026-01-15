import 'package:garbageman_marek/vendor.dart' as vendor;
import 'package:garbageman_marek/marek.dart' as marek;
import 'package:garbageman_marek/ui.dart' as ui;

class Game {

  void runGame() {

    var player = marek.Marek();
    var draw = ui.Ui();

    draw.logo();
    draw.walletAndGarbageCart(player.getWallet, player.getGarbageCart);

    var playersGarbage = player.getGarbageCart;
    var playersWallet = player.getWallet;

    if (playersGarbage == 0) {
      draw.mustBuy();
    } else if (playersGarbage == 0 && playersWallet <= 1.4) {
      print('YOU LOST');
    }else {
      draw.chooseBuyOrSell();
    }


  }

}
