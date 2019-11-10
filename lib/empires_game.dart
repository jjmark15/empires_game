import 'dart:io';

import 'package:empires_game/player_entry.dart';
import 'package:empires_game/terminal_utils.dart';


class EmpiresGame {
  static const Duration reelDelay = Duration(seconds: 2);
  List<PlayerEntry> entries;
  int playerCount;

  Future<PlayerEntry> acceptPlayerEntry() async {
    stdout.write("Player name: ");
    String playerName = stdin.readLineSync();
    stdout.write("Player secret word: ");
    String playerWord = stdin.readLineSync();
    return PlayerEntry()
      ..playerName = playerName
      ..playerWord = playerWord;
  }

  Future<List<PlayerEntry>> acceptAllPlayerEntries(int num) async {
    List<PlayerEntry> entries = List();
    clearTerminal();

    while (entries.length < this.playerCount) {
      PlayerEntry newEntry = await this.acceptPlayerEntry();
      entries.add(newEntry);
      clearTerminal();
    }

    return entries;
  }

  Future<int> acceptPlayerCount() async {
    print("How many players are there?");
    String numString = stdin.readLineSync();
    int result = int.tryParse(numString);
    return result;
  }

  List<String> getAllPlayerWords() {
    return this.entries.map((entry) => entry.playerWord).toList();
  }

  void displayAllEntries() {
    this.entries.forEach((entry) => print(entry.toString()));
  }

  static void reelOffWords(List<String> words, int numberOfReveals) async {
    clearTerminal();
    List<String> shuffled = List.from(words);
    shuffled.shuffle();
    for (int i = 0; i < numberOfReveals; i++) {
      for (String word in shuffled) {
        print(word);
        await Future.delayed(reelDelay);
      }
      clearTerminal();
    }
  }

  static void awaitFinishedGame() {
    print(
        "Press ENTER when the game has finished to see all player entries...");
    stdin.readLineSync();
  }

  static void awaitReadyToReelOff() {
    print("Press ENTER when ready to view all words entered...");
    stdin.readLineSync();
  }

  void play() async {
    this.playerCount = await this.acceptPlayerCount();
    print("Let the game begin!!");
    this.entries = await this.acceptAllPlayerEntries(this.playerCount);
    awaitReadyToReelOff();
    await reelOffWords(getAllPlayerWords(), 2);
    awaitFinishedGame();
    displayAllEntries();
  }
}
