import 'package:http/http.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/controller/parsers/parser_certificates.dart';
import 'package:uni/model/entities/certificate.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/entities/course.dart';

class CertificatesFetcher {
  Future<List<Certificate>> getCertificates(Store<AppState> store) async {
    final List<Course> courses = store.state.content['profile'].courses;
    final List<Response> responses = await Future.wait(courses.map((course) =>
        NetworkRouter.getWithCookies(
            NetworkRouter.getBaseUrlFromSession(
                    store.state.content['session']) +
                '''CERT_GERAL.ped_cert_list?pv_fest_id=${course.festId}''',
            {},
            store.state.content['session'])));

    final List<Certificate> certificates = await Future.wait(
            responses.map((response) => parseCertificates(response)))
        .then((certificates) => certificates.expand((c) => c).toList());

    return certificates;
  }
}
