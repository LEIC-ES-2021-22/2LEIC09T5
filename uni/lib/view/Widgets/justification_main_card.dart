import 'package:flutter/material.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/view/Widgets/justification_card.dart';

import 'generic_card.dart';

class JustificationMainCard extends GenericCard {
  JustificationMainCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      children: [
        JustificationCard('L.EIC', 'LDTS', Status.accepted, "2/1/22"),
        JustificationCard('M.EIC', 'ASO', Status.pending, "2/1/22"),
        JustificationCard('L.EIC', 'AED', Status.rejected, "4/2/21"),
      ],
    );
  }

  @override
  String getTitle() => 'Justificações';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navJustifications);
}
