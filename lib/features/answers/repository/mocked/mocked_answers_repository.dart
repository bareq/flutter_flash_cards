import 'dart:async';

import 'package:flashcardsflutter/features/answers/model/answer.dart';
import 'package:flashcardsflutter/features/answers/repository/answers_repository.dart';
import 'package:rxdart/rxdart.dart';

class MockedAnswersRepository extends AnswersRepository {
  final _answersStreamController = BehaviorSubject<List<Answer>>();
  late final Stream<List<Answer>> _answers;

  MockedAnswersRepository() {
    _answers = _answersStreamController.stream.asBroadcastStream();
  }

  final List<Answer> _mockedAnswers = [
    Answer(0, Status.known),
    Answer(1, Status.unknown),
  ];

  @override
  void fetchAnswers() async {
    await Future.delayed(const Duration(seconds: 1));
    _answersStreamController.add(_mockedAnswers);
  }

  @override
  Stream<List<Answer>> getAnswersStream() {
    return _answers;
  }

  @override
  void saveAnswer(int flashCardId, Status answerStatus) {
    final updatedAnswers = _answersStreamController.value;
    updatedAnswers.removeWhere((element) => element.id == flashCardId);
    updatedAnswers.add(Answer(flashCardId, answerStatus));
    _answersStreamController.add(updatedAnswers);
  }
}
