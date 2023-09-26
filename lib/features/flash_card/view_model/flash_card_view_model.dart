import 'package:flashcardsflutter/common/extensions/kotlin_let_extension.dart';
import 'package:flashcardsflutter/features/answers/use_case/fetch_answers/fetch_answers_use_case.dart';
import 'package:flashcardsflutter/features/flash_card/model/flash_card.dart';
import 'package:flashcardsflutter/features/flash_card/use_case/current_flash_card/get_current_card_use_case.dart';
import 'package:flashcardsflutter/features/game_mode/repository/game_mode_repository.dart';
import 'package:flutter/foundation.dart';

import '../../answers/use_case/save_answer/save_answer_use_case.dart';
import '../use_case/fetch_flash_cards/fetch_flash_cards_use_case.dart';

class FlashCardViewModel extends ChangeNotifier {
  final GetCurrentFlashCardUseCase _getCurrentCardUseCase;
  final FetchFlashCardsUseCase _fetchFlashCardsUseCase;
  final SaveAnswerUseCase _saveAnswerUseCase;
  final FetchAnswersUseCase _fetchAnswersUseCase;

  FlashCard? currentFlashCard;
  bool cardFlipped = false;

  FlashCardViewModel(
      {required GetCurrentFlashCardUseCase getCurrentCardUseCase,
      required FetchFlashCardsUseCase fetchFlashCardsUseCase,
      required SaveAnswerUseCase saveAnswerUseCase,
      required FetchAnswersUseCase fetchAnswersUseCase,
      required GameModeRepository gameModeRepository})
      : _getCurrentCardUseCase = getCurrentCardUseCase,
        _fetchFlashCardsUseCase = fetchFlashCardsUseCase,
        _saveAnswerUseCase = saveAnswerUseCase,
        _fetchAnswersUseCase = fetchAnswersUseCase {
    observeCurrentFlashCard();
    _fetchFlashCardsUseCase.execute();
    _fetchAnswersUseCase.execute();
  }

  void flipCard() {
    cardFlipped = !cardFlipped;
    notifyListeners();
  }

  void wordKnownClicked() {
    currentFlashCard?.let((it) {
      _saveAnswerUseCase.saveKnown(it.id);
    });
  }

  void wordUnknownClicked() {
    currentFlashCard?.let((it) {
      _saveAnswerUseCase.saveUnknown(it.id);
    });
  }

  void observeCurrentFlashCard() {
    _getCurrentCardUseCase.execute().listen((flashCard) {
      currentFlashCard = flashCard;
      cardFlipped = false;
      notifyListeners();
    });
  }
}
