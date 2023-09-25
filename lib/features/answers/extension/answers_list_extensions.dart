import '../model/answer.dart';

extension AnswersListExtensions on List<Answer> {
  bool isNotAnswered(int flashCardId) {
    final answerByFlashCardId = where((element) => element.id == flashCardId);
    if (answerByFlashCardId.isEmpty ||
        answerByFlashCardId.first.status == Status.notAnswered) {
      return true;
    }
    return false;
  }
}
