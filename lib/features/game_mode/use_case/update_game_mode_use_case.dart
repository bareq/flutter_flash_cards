import '../model/game_mode.dart';
import '../repository/game_mode_repository.dart';

class UpdateGameModeUseCase {
  final GameModeRepository _gameModeRepository;

  UpdateGameModeUseCase({required GameModeRepository gameModeRepository})
      : _gameModeRepository = gameModeRepository;

  void execute(GameMode gameMode) {
    _gameModeRepository.updateGameMode(gameMode);
  }
}
