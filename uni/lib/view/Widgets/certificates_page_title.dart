import 'package:flutter/material.dart';

class CertificatesPageTitle extends StatelessWidget {
  final String name = "Certificados";

  const CertificatesPageTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      alignment: Alignment.center,
      child: Row( // use Row to make title go to the left
        children: [
          Text(
            name,
            style:
                Theme.of(context).textTheme.headline6.apply(fontSizeDelta: 7),
          )
        ],
      ),
    );
  }
}