import 'package:flashcardsflutter/features/answers/repository/local_database/data_model/local_database_answer_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/answer.dart';

const tableName = 'answers';

class LocalDatabaseAnswersDataSource {
  Database? _database;

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'answers_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, status TEXT)',
        );
      },
      // Increment if database schema changes
      version: 1,
    );
  }

  Future<void> insertAnswer(Answer answer) async {
    if (_database == null) {
      await _initDatabase();
    }
    await _database!.insert(
      tableName,
      LocalDatabaseAnswerDto(id: answer.id, status: answer.status.name).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Answer>> getAnswers() async {
    if (_database == null) {
      await _initDatabase();
    }

    final List<Map<String, dynamic>> maps = await _database!.query(tableName);

    return List.generate(maps.length, (i) {
      return LocalDatabaseAnswerDto.fromMap(maps[i]).toDomain();
    });
  }
}
