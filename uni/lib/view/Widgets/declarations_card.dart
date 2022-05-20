import 'package:flutter/material.dart';

import '../../utils/constants.dart' as Constants;
import 'generic_card.dart';

class DeclarationsCard extends GenericCard {
  DeclarationsCard({Key key}) : super(key: key);

  DeclarationsCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    // TODO: implement buildCardContent

    return null;
  }

  @override
  String getTitle() => 'Declarações';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navDeclarations);
}
