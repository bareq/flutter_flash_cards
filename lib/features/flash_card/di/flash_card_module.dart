import 'package:flashcardsflutter/di/di_module.dart';
import 'package:flashcardsflutter/features/flash_card/repository/flash_cards_repository.dart';
import 'package:flashcardsflutter/features/flash_card/repository/local_file/data_source/local_file_flash_cards_data_source.dart';
import 'package:flashcardsflutter/features/flash_card/repository/local_file/local_file_flash_cards_repository.dart';
import 'package:flashcardsflutter/features/flash_card/use_case/current_flash_card/get_current_card_use_case.dart';
import 'package:flashcardsflutter/features/flash_card/use_case/fetch_flash_cards/fetch_flash_cards_use_case.dart';

import '../use_case/current_flash_card/service/get_current_flash_card_service.dart';

class FlashCardModule extends DIModule {
  @override
  void setupModule() {
    getIt.registerLazySingleton<LocalFileFlashCardsDataSource>(() {
      return LocalFileFlashCardsDataSource();
    });
    getIt.registerLazySingleton<FlashCardsRepository>(() {
      return LocalFileFlashCardsRepository(
          localFileFlashCardsDataSource: getIt.get());
    });
    getIt.registerLazySingleton<GetCurrentFlashCardService>(() {
      return GetCurrentFlashCardService();
    });
    getIt.registerLazySingleton<FetchFlashCardsUseCase>(() {
      return FetchFlashCardsUseCase(flashCardRepository: getIt.get());
    });
    getIt.registerLazySingleton<GetCurrentFlashCardUseCase>(() {
      return GetCurrentFlashCardUseCase(
        flashCardsRepository: getIt.get(),
        answersRepository: getIt.get(),
        gameModeRepository: getIt.get(),
        getCurrentFlashCardService: getIt.get(),
      );
    });
  }
}
