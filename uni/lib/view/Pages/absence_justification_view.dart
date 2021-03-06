import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/absence_justification_page_title.dart';
import 'package:uni/view/Pages/request_justification_page_view.dart';
import 'package:uni/view/Widgets/justification_card.dart';

class AbsenceJustificationPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AbsenceJustificationPageViewState();
}

class AbsenceJustificationPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                AbsenceJustificationPageTitle(),
                JustificationCard("L.EIC", "ESOF", Status.accepted, "24/01/2022"),
                JustificationCard("L.EIC", "ESOF", Status.pending, "02/01/2022"),
                JustificationCard("L.EIC", "ESOF", Status.rejected, "04/02/2021"),
              ]
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestJustificationPageView())),
      ),
    );
  }
}
