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
    if (gameMode.answerStatus == Status.notAnswered) {
      return flashCards
          .where((flashCard) => answers.isNotAnswered(flashCard.id))
          .firstOrNull;
    }
    return null;
  }
}
