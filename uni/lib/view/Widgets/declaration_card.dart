import 'package:flutter/material.dart';

class DeclarationRectangle extends StatelessWidget {
  // TODO: make this be in accordance with the mockups
  final String text;
  final double borderRadius = 10.0;

  DeclarationRectangle(String this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 27.5, vertical: 7.5),
        child: TextButton(
            onPressed: () {
              print(this.text);
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                foregroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 65, 65, 65))),
            onHover: null,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).hintColor),
                child: Text(this.text,
                    softWrap: true, textAlign: TextAlign.center))));
  }
}
