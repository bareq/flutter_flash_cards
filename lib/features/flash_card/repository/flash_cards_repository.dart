import '../model/flash_card.dart';

abstract class FlashCardsRepository {
  void fetchFlashCards();

  Stream<List<FlashCard>> getFlashCardsStream();

  void moveToEnd(int flashCardId);
}
