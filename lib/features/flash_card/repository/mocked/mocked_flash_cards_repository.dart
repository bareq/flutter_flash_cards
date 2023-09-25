import 'dart:async';

import '../../model/flash_card.dart';
import '../flash_cards_repository.dart';

class MockedFlashCardsRepository extends FlashCardsRepository {
  final _flashCardsStreamController = StreamController<List<FlashCard>>();
  late final Stream<List<FlashCard>> _flashCards;

  MockedFlashCardsRepository() {
    _flashCards = _flashCardsStreamController.stream.asBroadcastStream();
  }

  final _mockedFlashCards = [
    FlashCard(0, "pies", "Mam małego psa", "a dog", "I have a small dog"),
    FlashCard(1, "kot", "Ten kot jest czarny", "a cat", "This cat is black"),
    FlashCard(
        2, "jabłko", "Lubię jeść jabłka", "an apple", "I like to eat apples"),
    FlashCard(
        3, "samochód", "Mój samochód jest czerwony", "a car", "My car is red"),
    FlashCard(4, "książka", "Ta książka jest interesująca", "a book",
        "This book is interesting"),
  ];

  @override
  void fetchFlashCards() async {
    await Future.delayed(const Duration(seconds: 1));
    _flashCardsStreamController.add(_mockedFlashCards);
  }

  @override
  Stream<List<FlashCard>> getFlashCardsStream() {
    return _flashCards;
  }
}
