import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/declarations_page_title.dart';
import 'package:uni/view/Widgets/declaration_card.dart';

class DeclarationsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeclarationsPageViewState();
}

class DeclarationsPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(child: Column(children: this.buildChildren(context))),
      ],
    );
  }

  List<Widget> buildChildren(BuildContext context) {
    return <Widget>[
      DeclarationsPageTitle(),
      DeclarationRectangle("This is some sample DECLARATION text1"),
      DeclarationRectangle("This is some sample DECLARATION text2"),
      DeclarationRectangle("This is some sample DECLARATION text3"),
      DeclarationRectangle("This is some sample DECLARATION text4"),
    ];
  }
}
