import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/declarations_page_title.dart';
import 'package:uni/view/Widgets/declaration_card.dart';

class DeclarationsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeclarationsPageViewState();
}

class DeclarationsPageViewState extends SecondaryPageViewState {
  final double borderRadius = 12;

  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        DeclarationsPageTitle(),
        this.buildDeclarationsCard(context)
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
          text: "Declaração Multiusos", buttonAction: () => {print("oi1")}),
      DeclarationRectangle(
          text: "Declaração de Desclocamento",
          buttonAction: () => {print("oi2")}),
    ];
  }
}
