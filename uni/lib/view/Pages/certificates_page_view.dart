import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/certificate.dart';
import 'package:uni/view/Pages/request_certificates_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/certificates_page_title.dart';
import 'package:uni/view/Widgets/certification_card.dart';

class CertificatesPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CertificatesPageViewState();
}

class CertificatesPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<Certificate>>(
      key: Key('certificatesForm'),
      converter: (store) => store.state.content['certificates'],
      builder: (context, certificates) => Scaffold(
        body: ListView.builder(
          itemBuilder: ((context, i) => i == 0
              ? CertificatesPageTitle()
              : CertificationCard(certificates[i - 1])),
          itemCount: certificates.length + 1,
        ),
        floatingActionButton: FloatingActionButton(
          key: Key('certificatesFAB'),
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RequestCertificatesPageView())),
        ),
      ),
    );
  }
}
