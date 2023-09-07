import '../../model/flash_card.dart';
import '../flash_cards_repository.dart';

class MockedFlashCardsRepository extends FlashCardsRepository {
  MockedFlashCardsRepository() : super();

  @override
  Future<List<FlashCard>> fetchFlashCards() async {
    return [
      FlashCard("pies", "Mam małego psa", "a dog", "I have a small dog"),
      FlashCard("kot", "Ten kot jest czarny", "a cat", "This cat is black"),
      FlashCard(
          "jabłko", "Lubię jeść jabłka", "an apple", "I like to eat apples"),
      FlashCard(
          "samochód", "Mój samochód jest czerwony", "a car", "My car is red"),
      FlashCard("książka", "Ta książka jest interesująca", "a book",
          "This book is interesting"),
    ];
  }
}
