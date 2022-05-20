import 'package:flutter/material.dart';
import 'package:uni/utils/constants.dart' as Constants;

import 'generic_card.dart';

class CertificatesCard extends GenericCard {
  CertificatesCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      children: [
      ],
    );
  }

  @override
  String getTitle() {
    return "Certificados";
  }

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navCertificates);
}
