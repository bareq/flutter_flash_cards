import 'package:flashcardsflutter/features/flash_card/model/flash_card.dart';
import 'package:flashcardsflutter/features/flash_card/repository/flash_cards_repository.dart';
import 'package:flutter/foundation.dart';

class FlashCardViewModel extends ChangeNotifier {
  late FlashCardsRepository flashCardsRepository;

  List<FlashCard> flashCards = [];
  FlashCard? currentFlashCard;
  bool cardFlipped = false;

  FlashCardViewModel({required this.flashCardsRepository}) {
    getFlashCards();
  }

  void flipCard() {
    cardFlipped = !cardFlipped;
    notifyListeners();
  }

  void nextCard() {
    if (currentFlashCard == null) {
      return;
    }
    final index = flashCards.indexOf(currentFlashCard!);
    if (index < flashCards.length - 1) {
      currentFlashCard = flashCards[index + 1];
      cardFlipped = false;
      notifyListeners();
    }
  }

  void getFlashCards() async {
    flashCards = await flashCardsRepository.fetchFlashCards();
    currentFlashCard = flashCards.first;
  }
}
