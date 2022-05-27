import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:uni/model/entities/certificate.dart';

Future<List<Certificate>> parseCertificates(http.Response response) async {
  final document = parse(response.body);

  final List<Certificate> certificates = [];
  document
      .querySelectorAll('table.dados > tbody > .tr')
      .sublist(2)
      .forEach((element) {});
}
