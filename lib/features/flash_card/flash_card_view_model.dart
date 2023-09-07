import 'package:flashcardsflutter/features/flash_card/model/flash_card.dart';
import 'package:flutter/foundation.dart';

class FlashCardViewModel extends ChangeNotifier {
  final flashCards = <FlashCard>[
    FlashCard("Question title 1", "Question description 1", "Answer 1",
        "Answer description 1"),
    FlashCard("Question title 2", "Question description 2", "Answer 2",
        "Answer description 2"),
    FlashCard("Question title 3", "Question description 3", "Answer 3",
        "Answer description 3"),
    FlashCard("Question title 4", "Question description 4", "Answer 4",
        "Answer description 4"),
  ];
  late FlashCard currentFlashCard;
  late bool cardFlipped;

  FlashCardViewModel() {
    currentFlashCard = flashCards.first;
    cardFlipped = false;
  }

  void flipCard() {
    cardFlipped = !cardFlipped;
    notifyListeners();
  }

  void nextCard() {
    final index = flashCards.indexOf(currentFlashCard);
    if (index < flashCards.length - 1) {
      currentFlashCard = flashCards[index + 1];
      cardFlipped = false;
      notifyListeners();
    }
  }
}
