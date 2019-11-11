import 'package:empires_game/player_entry.dart';
import 'package:test/test.dart';

void main() {
  test("toString", () {
    String testName = "Josh";
    String testWord = "thingy";
    PlayerEntry playerEntry = PlayerEntry()
      ..playerName = testName
      ..playerWord = testWord;
    expect(playerEntry.toString(), "${testName}: \"$testWord\"");
  });

  test("setters should trim arguments", () {
    String testName = "  Josh";
    String testWord = "thingy    ";
    PlayerEntry playerEntry = PlayerEntry()
      ..playerName = testName
      ..playerWord = testWord;
    expect(playerEntry.playerName, testName.trim());
    expect(playerEntry.playerWord, testWord.trim());
  });
}
