import 'package:flashcardsflutter/features/answers/model/answer.dart';

abstract class AnswersRepository {
  void fetchAnswers();

  Stream<List<Answer>> getAnswersStream();

  void saveAnswer(int flashCardId, Status answerStatus);
}
