import 'package:flashcardsflutter/features/answers/repository/answers_repository.dart';
import 'package:flashcardsflutter/features/answers/use_case/fetch_answers/fetch_answers_use_case.dart';
import 'package:flashcardsflutter/features/answers/use_case/save_answer/save_answer_use_case.dart';

import '../../../di/di_module.dart';
import '../repository/mocked/mocked_answers_repository.dart';

class AnswersModule extends DIModule {
  @override
  void setupModule() {
    getIt.registerLazySingleton<AnswersRepository>(() {
      return MockedAnswersRepository();
    });
    getIt.registerLazySingleton<SaveAnswerUseCase>(() {
      return SaveAnswerUseCase(
          answerRepository: getIt.get(), flashCardRepository: getIt.get());
    });
    getIt.registerLazySingleton<FetchAnswersUseCase>(() {
      return FetchAnswersUseCase(answersRepository: getIt.get());
    });
  }
}
