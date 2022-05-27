import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/certificate.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/view/Widgets/certification_card.dart';

import 'generic_card.dart';

class CertificatesCard extends GenericCard {
  CertificatesCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, List<Certificate>>(
      converter: (store) => store.state.content['certificates'].sublist(0, 3),
      builder: (context, certificates) => Column(
        children: certificates.map((c) => CertificationCard(c)).toList(),
      ),
    );
  }

  @override
  String getTitle() => 'Certificados';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navCertificates);
}
