import 'dart:async';

import 'package:flashcardsflutter/features/answers/model/answer.dart';
import 'package:flashcardsflutter/features/answers/repository/answers_repository.dart';
import 'package:flashcardsflutter/features/answers/repository/local_database/data_source/local_database_answers_data_source.dart';

class LocalDatabaseAnswersRepository extends AnswersRepository {
  final LocalDatabaseAnswersDataSource _localDatabaseAnswersDataSource;

  final _answersStreamController = StreamController<List<Answer>>();
  late final Stream<List<Answer>> _answersStream =
      _answersStreamController.stream.asBroadcastStream();

  LocalDatabaseAnswersRepository(this._localDatabaseAnswersDataSource);

  @override
  Future<void> fetchAnswers() async {
    final answers = await _localDatabaseAnswersDataSource.getAnswers();
    _answersStreamController.add(answers);
  }

  @override
  Stream<List<Answer>> getAnswersStream() {
    return _answersStream;
  }

  @override
  void saveAnswer(int flashCardId, Status answerStatus) async {
    await _localDatabaseAnswersDataSource
        .insertAnswer(Answer(flashCardId, answerStatus));
    await fetchAnswers();
  }
}
