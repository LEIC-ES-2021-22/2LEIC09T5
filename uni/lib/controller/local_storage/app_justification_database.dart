import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/justification.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uni/view/Widgets/justification_card.dart';

class AppJustificationDatabase extends AppDatabase {
  AppJustificationDatabase()
      : super('justifications.db', [
          '''CREATE TABLE justifications(
            course TEXT,
            class TEXT,
            state TEXT CHECK (state LIKE "Accepted" OR state LIKE "Pending" OR state LIKE "Rejected"),
            date DATE
            )
        '''
        ]);

  Future<List<Justification>> justifications() async {
    final Database db = await this.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('justifications');

    return List.generate(maps.length, (i) {
      return Justification(
          course: maps[i]['course'],
          class_: maps[i]['class'],
          state: maps[i]['state'],
          date: maps[i]['date']);
    });
  }

  saveNewJustifications(List<Justification> justifications) async {
    await _insertJustifications(justifications);
  }

  Future<void> _insertJustifications(List<Justification> justifications) async {
    for (Justification justification in justifications) {
      await this.insertInDatabase(
        'justification',
        justification.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> deleteJustifications() async {
    final Database db = await this.getDatabase();

    await db.delete('justifications');
  }
}
