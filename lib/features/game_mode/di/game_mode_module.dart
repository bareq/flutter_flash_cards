import 'package:flashcardsflutter/features/game_mode/repository/memory/memory_game_mode_repository.dart';

import '../../../di/di_module.dart';
import '../repository/game_mode_repository.dart';

class GameModeModule extends DIModule {
  @override
  void setupModule() {
    getIt.registerSingleton<GameModeRepository>(MemoryGameModeRepository());
  }
}
