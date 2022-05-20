import 'package:flutter/material.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/view/Widgets/certification_card.dart';

import 'generic_card.dart';

class CertificatesCard extends GenericCard {
  CertificatesCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      children: [
        CertificationCard('Certificado 1', Status.accepted, "24/1/22"),
        CertificationCard('Certificado 2', Status.pending, "2/1/22"),
        CertificationCard('Certificado 3', Status.rejected, "4/2/21"),
      ],
    );
  }

  @override
  String getTitle() => 'Certificados';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navCertificates);
}
