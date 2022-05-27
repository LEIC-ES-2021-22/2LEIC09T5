import 'package:flutter/material.dart';
import 'package:uni/model/entities/certificate.dart';
import 'generic_card.dart';

/*
  TODO: may need to rethink our approach to this
*/
class CertificationCard extends GenericCard {
  final Certificate certificate;
  Color status_color;
  String status_text;

  CertificationCard(Certificate this.certificate) {
    switch (certificate.state) {
      case CertificateState.requested:
        status_text = 'Solicitado';
        status_color = Colors.black;
        break;
      case CertificateState.delivered:
        status_text = 'Entregue';
        status_color = Colors.green.shade800;
        break;
      case CertificateState.pending:
        status_text = 'Pendente';
        status_color = Colors.yellow.shade800;
        break;
      case CertificateState.canceled:
        status_text = 'Anulado';
        status_color = Colors.red.shade800;
        break;
    }
  }

  @override
  String getTitle() => null;

  @override
  onClick(BuildContext context) => null;

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            certificate.type,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Text(this.status_text,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: status_color)),
              Text(
                '${certificate.requestDate.day}/${certificate.requestDate.month}/${certificate.requestDate.year}',
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ])),
        if (certificate.downloadUrl != null &&
            certificate.downloadUrl.isNotEmpty)
          // TODO
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.download, color: Colors.black),
            tooltip: 'Baixar certificado',
          ),
      ],
    );
  }
}
