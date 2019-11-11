import 'package:test/test.dart';
import 'package:empires_game/empires_game.dart';

void main() {
  test("should request player count", () {
    EmpiresGame empiresGame = EmpiresGame()..setPlayerCount(0);
    expect(empiresGame.shouldRequestPlayerCount, true);
  });

  test("should not request player count", () {
    EmpiresGame empiresGame = EmpiresGame()..setPlayerCount(2);
    expect(empiresGame.shouldRequestPlayerCount, false);
  });
}
