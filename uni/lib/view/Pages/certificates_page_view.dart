import 'package:flutter/material.dart';
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

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                CertificatesPageTitle(),
                CertificationCard("Certificado 1", Status.accepted, "24/1/22"),
                CertificationCard("Certificado 2", Status.pending, "2/1/22"),
                CertificationCard("Certificado 3", Status.rejected, "4/2/21"),
              ]
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestCertificatesPageView())),
      ),
    );
  }

}
