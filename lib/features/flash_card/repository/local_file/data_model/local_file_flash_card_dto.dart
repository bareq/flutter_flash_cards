import 'package:flashcardsflutter/features/flash_card/model/flash_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_file_flash_card_dto.g.dart';

@JsonSerializable()
class LocalFileFlashCardDto {
  LocalFileFlashCardDto(
      {this.id,
      this.question,
      this.questionDescription,
      this.answer,
      this.answerDescription});

  int? id;
  String? question;
  String? questionDescription;
  String? answer;
  String? answerDescription;

  factory LocalFileFlashCardDto.fromJson(Map<String, dynamic> json) =>
      _$LocalFileFlashCardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocalFileFlashCardDtoToJson(this);

  FlashCard toDomain() {
    return FlashCard(question ?? "", questionDescription ?? "", answer ?? "",
        answerDescription ?? "");
  }
}
