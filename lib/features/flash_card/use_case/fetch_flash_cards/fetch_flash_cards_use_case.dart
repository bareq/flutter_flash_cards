import '../../repository/flash_cards_repository.dart';

class FetchFlashCardsUseCase {
  final FlashCardsRepository _flashCardRepository;

  FetchFlashCardsUseCase({required FlashCardsRepository flashCardRepository})
      : _flashCardRepository = flashCardRepository;

  void execute() async {
    await _flashCardRepository.fetchFlashCards();
  }
}
