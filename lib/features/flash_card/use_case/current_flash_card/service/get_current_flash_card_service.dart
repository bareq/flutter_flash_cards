import 'package:flashcardsflutter/features/answers/extension/answers_list_extensions.dart';
import 'package:flashcardsflutter/features/game_mode/model/game_mode.dart';

import '../../../../answers/model/answer.dart';
import '../../../model/flash_card.dart';

class GetCurrentFlashCardService {
  FlashCard? getCurrentFlashCard(
      List<FlashCard> flashCards, List<Answer> answers, GameMode gameMode) {
    if (flashCards.isEmpty) {
      return null;
    }
    if (answers.isEmpty) {
      return flashCards.first;
    }
    switch (gameMode.type) {
      case GameType.newWords:
        return flashCards
            .where((flashCard) => answers.isNotAnswered(flashCard.id))
            .firstOrNull;
      case GameType.unknownWords:
        return flashCards
            .where((flashCard) => answers.isUnknown(flashCard.id))
            .firstOrNull;
    }
  }
}
