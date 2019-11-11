import 'dart:io';

import 'package:empires_game/empires_game.dart' show EmpiresGame;
import 'package:args/args.dart';

void main(List<String> arguments) {
  String playerCountArg = "playerCount";
  final parser = ArgParser()
    ..addOption(playerCountArg, abbr: 'n', defaultsTo: "0");

  ArgResults argResults = parser.parse(arguments);
  int playerCount;

  try {
    playerCount = int.parse(argResults[playerCountArg]);
  } catch (e) {
    stderr.writeln("Invalid argument passed for " + playerCountArg);
    exit(1);
  }

  EmpiresGame()
    ..setPlayerCount(playerCount)
    ..play();
}
