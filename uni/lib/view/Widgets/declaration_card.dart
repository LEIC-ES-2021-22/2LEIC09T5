import 'package:flutter/material.dart';

class DeclarationRectangle extends StatelessWidget {
  final String text;
  final double borderRadius = 10.0;

  final buttonAction;

  DeclarationRectangle({Key key, String this.text, this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: OutlinedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size.fromHeight(37.5)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(this.borderRadius))),
              foregroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 65, 65, 65))),
          onPressed: () => {buttonAction(this.key.toString())},
          child: Text(this.text, softWrap: true, textAlign: TextAlign.center),
        ));
  }
}
