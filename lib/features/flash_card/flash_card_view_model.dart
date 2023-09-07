import 'package:flashcardsflutter/features/flash_card/model/flash_card.dart';
import 'package:flutter/foundation.dart';

class FlashCardViewModel extends ChangeNotifier {
  final currentFlashCard = FlashCard(
      "Question title", "Question description", "Answer", "Answer description");

  late bool cardFlipped;

  FlashCardViewModel() {
    cardFlipped = false;
  }

  void flipCard() {
    cardFlipped = !cardFlipped;
    notifyListeners();
  }
}
