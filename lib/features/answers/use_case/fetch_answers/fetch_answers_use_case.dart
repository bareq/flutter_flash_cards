import 'package:flashcardsflutter/features/answers/repository/answers_repository.dart';

class FetchAnswersUseCase {
  final AnswersRepository _answersRepository;

  FetchAnswersUseCase({required AnswersRepository answersRepository})
      : _answersRepository = answersRepository;

  void execute() async {
    _answersRepository.fetchAnswers();
  }
}
