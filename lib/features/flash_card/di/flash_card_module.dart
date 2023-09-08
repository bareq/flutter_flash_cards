import 'package:flashcardsflutter/di/di_module.dart';
import 'package:flashcardsflutter/features/flash_card/repository/flash_cards_repository.dart';
import 'package:flashcardsflutter/features/flash_card/repository/local_file/data_source/local_file_flash_cards_data_source.dart';
import 'package:flashcardsflutter/features/flash_card/repository/local_file/local_file_flash_cards_repository.dart';

class FlashCardModule extends DIModule {
  @override
  void setupModule() {
    getIt.registerSingleton<LocalFileFlashCardsDataSource>(
        LocalFileFlashCardsDataSource());
    getIt.registerSingleton<FlashCardsRepository>(LocalFileFlashCardsRepository(
        localFileFlashCardsDataSource: getIt<LocalFileFlashCardsDataSource>()));
  }
}
