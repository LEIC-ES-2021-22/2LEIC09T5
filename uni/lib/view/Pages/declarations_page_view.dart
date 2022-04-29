import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/declarations_page_title.dart';
import 'package:uni/view/Widgets/declaration_card.dart';
import 'package:uni/controller/declarations/declarations_fetcher.dart';
import 'package:uni/model/entities/declaration.dart';

class DeclarationsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeclarationsPageViewState();
}

class DeclarationsPageViewState extends SecondaryPageViewState {
  final double borderRadius = 12;
  bool declarationFetched = false;

  String declarationText;

  void declarationHandler(DeclarationType type) {
    this.setState(() {
      this.declarationFetched = false;
    });

    DeclarationsFetcher.getDeclaration(type).then((value) {
      this.setState(() {
        this.declarationFetched = true;
        this.declarationText = value;
      });
    });
  }

  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        DeclarationsPageTitle(),
        this.buildDeclarationsCard(context),
        this.showDeclaration(context)
      ],
    );
  }

  Widget buildDeclarationsCard(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.borderRadius),
          color: Color.fromARGB(255, 245, 245, 245),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 200, 200, 200),
                blurRadius: this.borderRadius / 2)
          ],
        ),
        child: Column(children: this.buildDeclarationButtons(context)));
  }

  List<Widget> buildDeclarationButtons(BuildContext context) {
    return <Widget>[
      DeclarationRectangle(
          key: Key("multiusos"),
          type: DeclarationType.MULTIUSOS,
          text: "Declaração Multiusos",
          buttonAction: this.declarationHandler),
      DeclarationRectangle(
          key: Key("deslocamento"),
          type: DeclarationType.DESLOCAMENTO,
          text: "Declaração de Deslocamento",
          buttonAction: this.declarationHandler),
    ];
  }

  Widget showDeclaration(BuildContext context) {
    if (!this.declarationFetched) {
      return Container(width: 0.0, height: 0.0);
    } // cannot return null, return container that takes as little space as possible

    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.borderRadius),
          color: Color.fromARGB(255, 245, 245, 245),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 200, 200, 200),
                blurRadius: this.borderRadius / 2)
          ],
        ),
        child: Text(this.declarationText, textAlign: TextAlign.center, key: Key("delcarationText")));
  }
}
