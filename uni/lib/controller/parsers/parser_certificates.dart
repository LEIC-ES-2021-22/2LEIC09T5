import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:uni/model/entities/certificate.dart';

Future<List<Certificate>> parseCertificates(http.Response response) async {
  final document = parse(response.body);

  print('HEY');

  return document
      .querySelectorAll('table.dados > tbody > tr')
      .sublist(2)
      .map((element) {
    final int id = int.parse(element.children[0].children[0].attributes['href']
        .replaceAllMapped(
            RegExp(r'CERT_GERAL\.PED_CERT_VIEW\?PV_PED_CERT_ID=(\d+)'),
            (match) => match.group(1)));
    final String type = element.children[0].text.trim();

    CertificateState state = CertificateState.requested;
    if (element.children[2].children[0].attributes['src'] ==
        'imagens/CERT-Visto') state = CertificateState.pending;
    if (element.children[3].classes.isNotEmpty) {
      switch (element.children[3].classes.first) {
        case 'result-pronto':
          state = CertificateState.delivered;
          break;
        case 'result-anulado':
          state = CertificateState.canceled;
          break;
      }
    }

    String downloadUrl = null;
    final downloadBtn = element.children[3].children[0];
    if (downloadBtn != null) downloadUrl = downloadBtn.attributes['href'];

    final DateTime requestDate =
        DateTime.parse(element.children[1].attributes['title']);

    print(type);

    return Certificate(id, type, state, downloadUrl, requestDate);
  }).toList();
}
