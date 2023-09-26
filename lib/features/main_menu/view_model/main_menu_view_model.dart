import 'package:flashcardsflutter/features/game_mode/model/game_mode.dart';
import 'package:flutter/foundation.dart';

import '../../game_mode/use_case/get_current_game_mode_use_case.dart';
import '../../game_mode/use_case/update_game_mode_use_case.dart';

class MainMenuViewModel extends ChangeNotifier {
  final UpdateGameModeUseCase _updateGameModeUseCase;
  final GetCurrentGameModeUseCase _getCurrentGameModeUseCase;

  GameMode gameMode = GameMode(type: GameType.newWords);
  int selectedMenuItem = 0;

  MainMenuViewModel(
      {required UpdateGameModeUseCase updateGameModeUseCase,
      required GetCurrentGameModeUseCase getCurrentGameModeUseCase})
      : _updateGameModeUseCase = updateGameModeUseCase,
        _getCurrentGameModeUseCase = getCurrentGameModeUseCase {
    _updateGameModeUseCase.execute(GameMode(type: GameType.newWords));
    _getCurrentGameModeUseCase.execute().listen((gameMode) {
      this.gameMode = gameMode;
      notifyListeners();
    });
  }

  void changeMenuItem(int index) {
    selectedMenuItem = index;
    _updateGameModeUseCase.execute(_extractGameModeFromIndex(index));
    notifyListeners();
  }

  GameMode _extractGameModeFromIndex(int index) {
    switch (index) {
      case 0:
        return GameMode(type: GameType.newWords);
      case 1:
        return GameMode(type: GameType.unknownWords);
      default:
        return GameMode(type: GameType.newWords);
    }
  }
}
