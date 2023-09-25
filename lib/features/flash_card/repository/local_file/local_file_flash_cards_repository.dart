import 'dart:async';

import '../../model/flash_card.dart';
import '../flash_cards_repository.dart';
import 'data_source/local_file_flash_cards_data_source.dart';

class LocalFileFlashCardsRepository extends FlashCardsRepository {
  final LocalFileFlashCardsDataSource _localFileFlashCardsDataSource;

  final _flashCardsStreamController = StreamController<List<FlashCard>>();
  late final Stream<List<FlashCard>> _flashCards;

  LocalFileFlashCardsRepository(
      {required LocalFileFlashCardsDataSource localFileFlashCardsDataSource})
      : _localFileFlashCardsDataSource = localFileFlashCardsDataSource {
    _flashCards = _flashCardsStreamController.stream.asBroadcastStream();
  }

  @override
  void fetchFlashCards() async {
    final flashCards = await _localFileFlashCardsDataSource.getFlashCards();
    _flashCardsStreamController.add(flashCards);
  }

  @override
  Stream<List<FlashCard>> getFlashCardsStream() {
    return _flashCards;
  }
}
