import 'package:flashcardsflutter/features/answers/repository/answers_repository.dart';

import '../../../flash_card/repository/flash_cards_repository.dart';
import '../../model/answer.dart';

class SaveAnswerUseCase {
  final AnswersRepository _answerRepository;
  final FlashCardsRepository _flashCardRepository;

  SaveAnswerUseCase(
      {required AnswersRepository answerRepository,
      required FlashCardsRepository flashCardRepository})
      : _answerRepository = answerRepository,
        _flashCardRepository = flashCardRepository;

  void saveKnown(int flashCardId) async {
    _answerRepository.saveAnswer(flashCardId, Status.known);
  }

  void saveUnknown(int flashCardId) async {
    _answerRepository.saveAnswer(flashCardId, Status.unknown);
    _flashCardRepository.moveToEnd(flashCardId);
  }
}
