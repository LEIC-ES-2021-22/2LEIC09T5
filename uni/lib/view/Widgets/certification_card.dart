import 'package:flutter/material.dart';
import 'generic_card.dart';

enum Status { accepted, pending, rejected }

/*
  TODO: may need to rethink our approach to this
*/
class CertificationCard extends GenericCard {
  final String name;
  final Status status;
  final String date;
  final double borderRadius = 10.0;
  Color status_color;
  String status_text;

  CertificationCard(String this.name, Status this.status, String this.date) {
    switch (status) {
      case Status.accepted:
        status_text = "Aceite";
        status_color = Colors.green.shade800;
        break;
      case Status.pending:
        status_text = "Pendente";
        status_color = Colors.yellow.shade800;
        break;
      case Status.rejected:
        status_text = "Rejeitado";
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
          child: Text(this.name, softWrap: true, textAlign: TextAlign.center),
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
              Text(this.date, softWrap: true, textAlign: TextAlign.center),
            ])),
        if (this.status == Status.accepted)
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.download, color: Colors.black),
            tooltip: 'Baixar certificado',
          ),
      ],
    );
  }
}
