import '../model/game_mode.dart';
import '../repository/game_mode_repository.dart';

class GetCurrentGameModeUseCase {
  final GameModeRepository _gameModeRepository;

  GetCurrentGameModeUseCase({required GameModeRepository gameModeRepository})
      : _gameModeRepository = gameModeRepository;

  Stream<GameMode> execute() {
    return _gameModeRepository.getCurrentGameModeStream();
  }
}
