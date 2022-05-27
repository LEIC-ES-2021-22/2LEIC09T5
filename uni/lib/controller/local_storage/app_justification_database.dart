import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/justification.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uni/view/Widgets/justification_card.dart';

class AppJustificationDatabase extends AppDatabase {
  AppJustificationDatabase()
      : super('justifications.db', [
          '''CREATE TABLE justifications(course TEXT, state TEXT, date DATE)
        '''
        ]);

  Future<List<Justification>> justifications() async {
    final Database db = await this.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('justifications');

    return List.generate(maps.length, (i) {
      return Justification(
        course: maps[i]['course'],
        state: maps[i]['state'],
        date: maps[i]['date']
      );
    });
  }
}
