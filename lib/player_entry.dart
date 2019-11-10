class PlayerEntry {
  String playerName;
  String playerWord;

  @override
  String toString() {
    return "${playerName}: \"$playerWord\"";
  }
}
