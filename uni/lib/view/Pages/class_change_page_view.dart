import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/class_change_page_title.dart';
import 'package:uni/view/Widgets/class_change_card.dart';
import 'package:uni/model/entities/class_change.dart';
import 'package:uni/view/Pages/request_class_change_page_view.dart';

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
    final children = [
      // these are just for testing purposes
      ClassChangeCard(ClassChange(
          'Nuno Afonso Anjos Pereira',
          202007865,
          'Laboratório de Desenho e Teste de Software',
          '2L.EIC01',
          '2L.EIC02')),
      ClassChangeCard(ClassChange('Nuno Afonso Anjos Pereira', 202007865,
          'Algoritmos e Estruturas de Dados', '2L.EIC09', '2L.EIC08')),
      ClassChangeCard(ClassChange('Nuno Afonso Anjos Pereira', 202007865,
          'Física 2', '2L.EIC12', '2L.EIC13')),
      ClassChangeCard(ClassChange('Nuno Afonso Anjos Pereira', 202007865,
          'Programação', '2L.EIC12', '2L.EIC13')),
    ];

    return Scaffold(
      body: ListView(
        children: <Widget>[
          ClassChangePageTitle(),
          ListView.separated(
            padding: EdgeInsets.only(bottom: 20),
            itemCount: children.length,
            itemBuilder: (context, i) => children[i],
            separatorBuilder: (context, i) =>
                SizedBox.fromSize(size: Size.fromHeight(10)),
            shrinkWrap: true,
            primary: false,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestClassChangePageView())),
      ),
    );
  }
}
