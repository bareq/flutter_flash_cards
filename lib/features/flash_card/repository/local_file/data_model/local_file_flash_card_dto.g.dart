// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_file_flash_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalFileFlashCardDto _$LocalFileFlashCardDtoFromJson(
        Map<String, dynamic> json) =>
    LocalFileFlashCardDto(
      id: json['id'] as int?,
      question: json['question'] as String?,
      questionDescription: json['questionDescription'] as String?,
      answer: json['answer'] as String?,
      answerDescription: json['answerDescription'] as String?,
    );

Map<String, dynamic> _$LocalFileFlashCardDtoToJson(
        LocalFileFlashCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'questionDescription': instance.questionDescription,
      'answer': instance.answer,
      'answerDescription': instance.answerDescription,
    };
