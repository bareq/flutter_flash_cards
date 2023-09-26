import 'dart:async';

import 'package:flashcardsflutter/common/extensions/kotlin_let_extension.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/flash_card.dart';
import '../flash_cards_repository.dart';
import 'data_source/local_file_flash_cards_data_source.dart';

class LocalFileFlashCardsRepository extends FlashCardsRepository {
  final LocalFileFlashCardsDataSource _localFileFlashCardsDataSource;

  final _flashCardsStreamController = BehaviorSubject<List<FlashCard>>();
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

  @override
  void moveToEnd(int flashCardId) {
    final currentFlashCards = _flashCardsStreamController.value;
    final selectedFlashCard = currentFlashCards
        .where((element) => element.id == flashCardId)
        .firstOrNull;
    selectedFlashCard?.let((it) {
      currentFlashCards.removeWhere((element) => element.id == flashCardId);
      currentFlashCards.add(it);
      _flashCardsStreamController.add(currentFlashCards);
    });
  }
}
