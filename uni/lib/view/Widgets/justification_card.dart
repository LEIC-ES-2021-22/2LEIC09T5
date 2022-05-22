import 'package:flutter/material.dart';
import 'generic_card.dart';

enum Status { accepted, pending, rejected }

/*
  TODO: may need to rethink our approach to this
*/
class JustificationCard extends GenericCard {
  final String course;
  final String courseClass;
  final Status status;
  final String date;
  final double borderRadius = 10.0;
  Color status_color;
  String status_text;
  Color secondary_text_color = Colors.grey.shade600;

  JustificationCard(String this.course, String this.courseClass, Status this.status, String this.date) {
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
            margin: const EdgeInsets.only(top: 10.0, bottom: 30.0, left: 15.0, right: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Text("Curso:", softWrap: false, textAlign: TextAlign.center, style: TextStyle(color: secondary_text_color)),
              Text(this.course, softWrap: false, textAlign: TextAlign.center),
            ])),
        Container(
            margin: const EdgeInsets.only(bottom: 30.0, left: 15.0, right: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Text("Cadeira:", softWrap: true, textAlign: TextAlign.center, style: TextStyle(color: secondary_text_color)),
              Text(this.courseClass, softWrap: true, textAlign: TextAlign.center),
            ])),    
        Container(
            margin: const EdgeInsets.only(bottom: 10.0),
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
      ],
    );
  }
}