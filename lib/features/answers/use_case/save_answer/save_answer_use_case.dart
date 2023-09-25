import 'package:flashcardsflutter/features/answers/repository/answers_repository.dart';

import '../../model/answer.dart';

class SaveAnswerUseCase {
  final AnswersRepository _answerRepository;

  SaveAnswerUseCase({required AnswersRepository answerRepository})
      : _answerRepository = answerRepository;

  void saveKnown(int flashCardId) async {
    _answerRepository.saveAnswer(flashCardId, Status.known);
  }

  void saveUnknown(int flashCardId) async {
    _answerRepository.saveAnswer(flashCardId, Status.unknown);
  }
}
