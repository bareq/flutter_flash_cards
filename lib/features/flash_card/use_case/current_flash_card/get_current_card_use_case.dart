import 'package:flashcardsflutter/features/flash_card/use_case/current_flash_card/service/get_current_flash_card_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../answers/repository/answers_repository.dart';
import '../../../game_mode/repository/game_mode_repository.dart';
import '../../model/flash_card.dart';
import '../../repository/flash_cards_repository.dart';

class GetCurrentFlashCardUseCase {
  final FlashCardsRepository _flashCardsRepository;
  final AnswersRepository _answersRepository;
  final GameModeRepository _gameModeRepository;

  final GetCurrentFlashCardService _getCurrentFlashCardService;

  GetCurrentFlashCardUseCase(
      {required FlashCardsRepository flashCardsRepository,
      required AnswersRepository answersRepository,
      required GameModeRepository gameModeRepository,
      required GetCurrentFlashCardService getCurrentFlashCardService})
      : _flashCardsRepository = flashCardsRepository,
        _answersRepository = answersRepository,
        _gameModeRepository = gameModeRepository,
        _getCurrentFlashCardService = getCurrentFlashCardService;

  Stream<FlashCard?> execute() {
    return CombineLatestStream.combine3(
        _flashCardsRepository.getFlashCardsStream(),
        _answersRepository.getAnswersStream(),
        _gameModeRepository.getCurrentGameModeStream(),
        (flashCards, answers, gameMode) {
      return _getCurrentFlashCardService.getCurrentFlashCard(
          flashCards, answers, gameMode);
    });
  }
}
