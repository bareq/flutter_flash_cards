class GameMode {
  final GameType type;

  GameMode({required this.type});
}

enum GameType { newWords, unknownWords }
