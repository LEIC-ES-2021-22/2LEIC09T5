import 'package:sqflite/sqflite.dart';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/certificate.dart';

class AppCertificatesDatabase extends AppDatabase {
  static final createScript =
      '''CREATE TABLE certificates(type INTEGER, state INTEGER)''';

  AppCertificatesDatabase() : super('certificates.db', [createScript]);

  saveNewCertificates(List<Certificate> certs) async {
    await deleteCertificates();
    await _insertCertificates(certs);
  }

  Future<List<Certificate>> certificates() async {
    final Database db = await this.getDatabase();

    final List<Map<String, dynamic>> maps = await db.query('certificates');

    return List.generate(
      maps.length,
      (i) => Certificate(
        CertificateType.values[maps[i]['type']],
        CertificateState.values[maps[i]['state']],
      ),
    );
  }

  Future<void> _insertCertificates(List<Certificate> certs) async {
    for (Certificate cert in certs) {
      await this.insertInDatabase(
        'certificates',
        cert.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> deleteCertificates() async {
    final Database db = await this.getDatabase();

    await db.delete('certificates');
  }
}
