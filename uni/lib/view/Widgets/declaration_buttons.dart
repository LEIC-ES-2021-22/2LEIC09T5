import 'package:flutter/widgets.dart';
import 'package:uni/model/entities/declaration.dart';
import 'declaration_rectangle.dart';

class DeclarationButtons extends StatelessWidget {
  final handler;

  const DeclarationButtons({
    Key key,
    this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeclarationRectangle(
          buttonKey: 'multiusos',
          type: DeclarationType.MULTIUSOS,
          text: 'Declaração Multiusos',
          buttonAction: this.handler,
        ),
        DeclarationRectangle(
          buttonKey: 'deslocamento',
          type: DeclarationType.DESLOCAMENTO,
          text: 'Declaração de Deslocamento',
          buttonAction: this.handler,
        ),
      ],
    );
  }
}
