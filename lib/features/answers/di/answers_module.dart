import 'package:flashcardsflutter/features/answers/repository/answers_repository.dart';
import 'package:flashcardsflutter/features/answers/use_case/fetch_answers/fetch_answers_use_case.dart';
import 'package:flashcardsflutter/features/answers/use_case/save_answer/save_answer_use_case.dart';

import '../../../di/di_module.dart';
import '../repository/mocked/mocked_answers_repository.dart';

class AnswersModule extends DIModule {
  @override
  void setupModule() {
    getIt.registerSingleton<AnswersRepository>(MockedAnswersRepository());
    getIt.registerSingleton<SaveAnswerUseCase>(
        SaveAnswerUseCase(answerRepository: getIt.get()));
    getIt.registerSingleton<FetchAnswersUseCase>(
        FetchAnswersUseCase(answersRepository: getIt.get()));
  }
}
