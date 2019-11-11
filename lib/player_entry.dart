class PlayerEntry {
  String _playerName;
  String _playerWord;

  set playerWord(String playerWord) {
    this._playerWord = playerWord.trim();
  }

  String get playerWord {
    return this._playerWord;
  }

  set playerName(String playerName) {
    this._playerName = playerName.trim();
  }

  String get playerName {
    return this._playerName;
  }

  @override
  String toString() {
    return "${playerName}: \"$playerWord\"";
  }
}
