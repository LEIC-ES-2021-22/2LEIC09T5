import 'package:flutter/material.dart';

class DeclarationRectangle extends StatelessWidget {
  final String text;
  final double borderRadius = 10.0;

  DeclarationRectangle(String this.text);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 65, 65, 65)),
        ),
        onPressed: () {},
        onHover: null,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).hintColor),
            child:
                Text(this.text, softWrap: true, textAlign: TextAlign.center)));

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).hintColor),
        child: Text(this.text, softWrap: true, textAlign: TextAlign.center));
  }
}
