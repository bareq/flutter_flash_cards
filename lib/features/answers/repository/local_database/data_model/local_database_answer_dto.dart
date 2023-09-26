import '../../../model/answer.dart';

class LocalDatabaseAnswerDto {
  final int id;
  final String status;

  const LocalDatabaseAnswerDto({required this.id, required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return LocalDatabaseAnswerDto(
      id: map['id'],
      status: map['status'],
    );
  }

  Answer toDomain() {
    return Answer(
        id, Status.values.where((element) => element.name == status).first);
  }
}
