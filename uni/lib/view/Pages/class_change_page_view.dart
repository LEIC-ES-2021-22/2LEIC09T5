import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/class_change_page_title.dart';
import 'package:uni/view/Widgets/declaration_rectangle.dart';
import 'package:uni/controller/declarations/declarations_fetcher.dart';
import 'package:uni/model/entities/declaration.dart';

class ClassChangePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClassChangePageViewState();
}

class ClassChangePageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return ClassChangePageContent();
  }
}

class ClassChangePageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClassChangePageContentState();
}

class ClassChangePageContentState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ClassChangePageTitle(),
        // this.buildDeclarationsCard(context),
      ],
    );
  }
}
