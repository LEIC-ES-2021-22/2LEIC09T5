import 'package:flutter/material.dart';
import 'package:uni/model/entities/declaration.dart';

class DeclarationRectangle extends StatelessWidget {
  final String text;
  final DeclarationType type;
  final String buttonKey;
  final double borderRadius = 10.0;

  final buttonAction;

  DeclarationRectangle({
    Key key,
    DeclarationType this.type,
    String this.text,
    this.buttonAction,
    String this.buttonKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
        child: OutlinedButton(
          key: Key(this.buttonKey),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size.fromHeight(42.5)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(this.borderRadius))),
              foregroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 65, 65, 65))),
          onPressed: () => {buttonAction != null && buttonAction(this.type)},
          child: Text(this.text, softWrap: true, textAlign: TextAlign.center),
        ));
  }
}
