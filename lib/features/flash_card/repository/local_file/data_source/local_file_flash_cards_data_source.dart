import 'dart:convert';

import 'package:flashcardsflutter/features/flash_card/repository/local_file/data_model/local_file_flash_card_dto.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../model/flash_card.dart';

class LocalFileFlashCardsDataSource {
  Future<List<FlashCard>> getFlashCards() async {
    String fileContent = await rootBundle.loadString('assets/flash_cards.json');
    final jsonResult = jsonDecode(fileContent) as List;
    return jsonResult
        .map((jsonItem) => LocalFileFlashCardDto.fromJson(jsonItem).toDomain())
        .toList();
  }
}
