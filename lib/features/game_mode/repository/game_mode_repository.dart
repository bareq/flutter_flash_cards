import 'package:flashcardsflutter/features/game_mode/model/game_mode.dart';

abstract class GameModeRepository {
  Stream<GameMode> getCurrentGameModeStream();
  void updateGameMode(GameMode newGameMode);
}
