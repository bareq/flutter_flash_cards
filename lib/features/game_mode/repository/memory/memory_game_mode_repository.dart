import 'dart:async';

import 'package:flashcardsflutter/features/game_mode/model/game_mode.dart';

import '../game_mode_repository.dart';

class MemoryGameModeRepository extends GameModeRepository {
  final _currentGameModeController = StreamController<GameMode>();
  late final Stream<GameMode> _currentGameMode;

  MemoryGameModeRepository() {
    _currentGameMode = _currentGameModeController.stream.asBroadcastStream();
  }

  @override
  Stream<GameMode> getCurrentGameModeStream() {
    return _currentGameMode;
  }

  @override
  void updateGameMode(GameMode newGameMode) {
    _currentGameModeController.add(newGameMode);
  }
}
