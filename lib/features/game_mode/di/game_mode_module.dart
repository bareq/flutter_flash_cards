import 'package:flashcardsflutter/features/game_mode/repository/memory/memory_game_mode_repository.dart';
import 'package:flashcardsflutter/features/game_mode/use_case/get_current_game_mode_use_case.dart';
import 'package:flashcardsflutter/features/game_mode/use_case/update_game_mode_use_case.dart';

import '../../../di/di_module.dart';
import '../repository/game_mode_repository.dart';

class GameModeModule extends DIModule {
  @override
  void setupModule() {
    getIt.registerLazySingleton<GameModeRepository>(() {
      return MemoryGameModeRepository();
    });
    getIt.registerLazySingleton<UpdateGameModeUseCase>(() {
      return UpdateGameModeUseCase(gameModeRepository: getIt.get());
    });
    getIt.registerLazySingleton<GetCurrentGameModeUseCase>(() {
      return GetCurrentGameModeUseCase(gameModeRepository: getIt.get());
    });
  }
}
