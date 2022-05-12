import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/certificates_page_title.dart';
import 'package:uni/view/Widgets/certification_card.dart';

class CertificatesPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CertificatesPageViewState();
}

class CertificatesPageViewState extends SecondaryPageViewState {
  final double borderRadius = 12;

  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            child: Column(children: <Widget>[
          CertificatesPageTitle(),
          CertificationCard("Certificado 1", Status.accepted, "24/1/22"),
          CertificationCard("Certificado 2", Status.pending, "2/1/22"),
          CertificationCard("Certificado 3", Status.rejected, "4/2/21"),
        ])),
      ],
    );
  }
}
