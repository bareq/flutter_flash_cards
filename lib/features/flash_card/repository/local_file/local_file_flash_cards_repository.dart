import '../../model/flash_card.dart';
import '../flash_cards_repository.dart';
import 'data_source/local_file_flash_cards_data_source.dart';

class LocalFileFlashCardsRepository extends FlashCardsRepository {
  LocalFileFlashCardsRepository() : super();

  final LocalFileFlashCardsDataSource localFileFlashCardsDataSource =
      LocalFileFlashCardsDataSource();

  @override
  Future<List<FlashCard>> fetchFlashCards() async {
    return await localFileFlashCardsDataSource.getFlashCards();
  }
}
