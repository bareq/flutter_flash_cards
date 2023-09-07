import '../model/flash_card.dart';

abstract class FlashCardsRepository {
  Future<List<FlashCard>> fetchFlashCards();
}
