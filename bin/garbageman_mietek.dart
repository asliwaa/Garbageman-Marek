// bin/garbageman_mietek.dart
import 'package:garbageman_marek/game.dart' as game;
import 'package:garbageman_marek/ui.dart' as ui;

void main(List<String> arguments) {
  // Tu "wstrzykujemy" konkretną implementację (ConsoleUi)
  var consoleInterface = ui.ConsoleUi();
  
  var g = game.Game(consoleInterface);
  g.runGame();
}